import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/firebase_options.dart';
import 'package:zoom_clone_firebase/resources/auth_methods.dart';
import 'package:zoom_clone_firebase/screens/home_screen.dart';
import 'package:zoom_clone_firebase/screens/join_meeting_screen.dart';
import 'package:zoom_clone_firebase/screens/login_screen.dart';
import 'package:zoom_clone_firebase/screens/meeting_room_screen.dart';
import 'package:zoom_clone_firebase/screens/new_meeting_screen.dart';
import 'package:zoom_clone_firebase/screens/waiting_room_screen.dart';
import 'package:zoom_clone_firebase/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Zoom Clone With Firebase - PookieeStimit',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/new-meeting': (context) => NewMeetingScreen(),
          '/join-meeting': (context) => JoinMeetingScreen(),
          '/waiting-room': (context) {
            final args =
                ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>;
            return WaitingRoomScreen(
              roomId: args['roomId'],
              userName: args['userName'],
              isMicOff: args['isMicOff'],
              isCameraOff: args['isCameraOff'],
            );
          },
          '/meeting-room': (context) {
            final args =
                ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>;
            return MeetingRoomScreen(
              roomId: args['roomId'],
              userName: args['userName'],
              isMicOff: args['isMicOff'],
              isCameraOff: args['isCameraOff'],
              isHost: args['isHost'],
            );
          },
        },

        // home: const LoginScreen(),
        home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              return const HomeScreen();
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
