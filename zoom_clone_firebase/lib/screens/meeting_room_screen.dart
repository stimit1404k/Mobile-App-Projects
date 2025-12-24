import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:zoom_clone_firebase/core/secret/secret_key.dart';

class MeetingRoomScreen extends StatefulWidget {
  final String roomId;
  final String userName;
  final bool isMicOff;
  final bool isCameraOff;
  final bool isHost;

  const MeetingRoomScreen({
    super.key,
    required this.roomId,
    required this.userName,
    required this.isMicOff,
    required this.isCameraOff,
    required this.isHost,
  });

  @override
  State<MeetingRoomScreen> createState() => _MeetingRoomScreenState();
}

class _MeetingRoomScreenState extends State<MeetingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? 'user_id';
    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltVideoConference(
          appID: zoomCloneAppId,
          appSign: zoomCloneAppSign,
          userID: userId,
          userName: widget.userName,
          conferenceID: widget.roomId.trim(),
          config:
              ZegoUIKitPrebuiltVideoConferenceConfig()
                ..turnOnCameraWhenJoining = !widget.isCameraOff
                ..turnOnMicrophoneWhenJoining = !widget.isMicOff,
        ),
      ),
    );
  }
}
