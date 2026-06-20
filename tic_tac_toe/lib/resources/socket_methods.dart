import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/resources/app_navigator.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/game_methods.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/utils/utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  IO.Socket get socketClient => _socketClient;

  BuildContext? get _rootContext => navigatorKey.currentContext;

  // emits
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {'nickname': nickname});
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {'nickname': nickname, 'roomId': roomId});
    }
  }

  void tapGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == '') {
      _socketClient.emit('tap', {'index': index, 'roomId': roomId});
    }
  }

  // listener
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      ).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      ).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      showSnackBar(rootContext, data);
    });
  }

  void updatePlayerStateListener(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      ).updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      ).updatePlayer2(playerData[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      ).updateRoomData(data);
    });
  }

  void tappedListener(BuildContext context) {
    _socketClient.on('tapped', (data) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      );
      roomDataProvider.updateDisplayElements(data['index'], data['choice']);

      roomDataProvider.updateRoomData(data['room']);

      // check winner
      GameMethods().checkWinner(rootContext, _socketClient);
    });
  }

  void pointIncreaseListener(BuildContext context) {
    _socketClient.on('pointIncrease', (playerData) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      var roomDataProvider = Provider.of<RoomDataProvider>(
        rootContext,
        listen: false,
      );

      if (playerData['socketID'] == roomDataProvider.player1.socketID) {
        roomDataProvider.updatePlayer1(playerData);
      } else {
        roomDataProvider.updatePlayer2(playerData);
      }
    });
  }

  void endGameListener(BuildContext context) {
    _socketClient.on('endGame', (playerData) {
      final rootContext = _rootContext;
      if (rootContext == null) {
        return;
      }

      showGameDialog(rootContext, '${playerData['nickname']} won the game!!');
      Navigator.of(rootContext).popUntil((route) => route.isFirst);
    });
  }
}
