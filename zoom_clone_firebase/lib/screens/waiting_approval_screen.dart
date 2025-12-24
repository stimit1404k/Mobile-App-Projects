import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/provider/waiting_room_provider.dart';
import 'package:zoom_clone_firebase/utils/colors.dart';
import 'package:zoom_clone_firebase/widgets/bouncing_dot.dart';

class WaitingApprovalScreen extends ConsumerWidget {
  final String roomId;
  final String userName;
  final bool isMicOff;
  final bool isCameraOff;

  const WaitingApprovalScreen({
    super.key,
    required this.roomId,
    required this.userName,
    required this.isMicOff,
    required this.isCameraOff,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approvedStatusAsyncValue = ref.watch(
      approvedStatusProvider((roomId, userName)),
    );
    return approvedStatusAsyncValue.when(
      data: (data) {
        final status = data?['status'];

        if (status == 'approved') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(
              context,
              '/meeting-room',
              arguments: {
                'roomId': roomId,
                'userName': userName,
                'isMicOff': isMicOff,
                'isCameraOff': isCameraOff,
                'isHost': false,
              },
            );
          });
        } else if (status == 'rejected') {
          return Scaffold(
            body: Center(
              child: Text('Your request to join the meeting was rejected.'),
            ),
          );
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Waiting for approval ', style: TextStyle(fontSize: 18)),
                BouncingDot(
                  color: buttonColor,
                  size: 8,
                  duration: Duration(milliseconds: 600),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, _) => Scaffold(body: Center(child: Text('Error: $error'))),
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
