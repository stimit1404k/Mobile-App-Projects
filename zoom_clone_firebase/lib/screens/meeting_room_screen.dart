import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:zoom_clone_firebase/core/secret/secret_key.dart';
import 'package:zoom_clone_firebase/widgets/meeting_timer.dart';
import 'package:zoom_clone_firebase/widgets/pending_participants_list.dart';

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
        child: Stack(
          children: [
            ZegoUIKitPrebuiltVideoConference(
              appID: zoomCloneAppId,
              appSign: zoomCloneAppSign,
              userID: userId,
              userName: widget.userName,
              conferenceID: widget.roomId.trim(),
              config:
                  ZegoUIKitPrebuiltVideoConferenceConfig()
                    ..layout = ZegoLayout.gallery()
                    ..turnOnCameraWhenJoining = !widget.isCameraOff
                    ..turnOnMicrophoneWhenJoining = !widget.isMicOff
                    ..memberListConfig = ZegoMemberListConfig(
                      itemBuilder: (context, size, user, extraInfo) {
                        return CustomMemberListItem(
                          user: user,
                          isHost: widget.isHost,
                          currentUserId: userId,
                        );
                      },
                    ),
            ),
            const Positioned(top: 10, right: 10, child: MeetingTimer()),
            if (widget.isHost)
              Positioned(
                top: 10,
                left: 10,
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance
                          .collection('rooms')
                          .doc(widget.roomId)
                          .collection('waiting_room')
                          .where('status', isEqualTo: 'pending')
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    final pendingCount = snapshot.data!.docs.length;
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) =>
                                  PendingParticipantsList(roomId: widget.roomId),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "$pendingCount Pending",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomMemberListItem extends StatelessWidget {
  final ZegoUIKitUser user;
  final bool isHost;
  final String currentUserId;

  const CustomMemberListItem({
    super.key,
    required this.user,
    required this.isHost,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              user.name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          if (isHost && user.id != currentUserId)
            IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text("Remove Participant"),
                        content: Text(
                          "Are you sure you want to remove ${user.name}?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              ZegoUIKit().removeUserFromRoom([user.id]);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Remove",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                );
              },
            ),
        ],
      ),
    );
  }
}
