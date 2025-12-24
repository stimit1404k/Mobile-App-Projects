import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/provider/new_meeting_provider.dart';

void startMeeting(
  WidgetRef ref,
  BuildContext context,
  TextEditingController nameController,
) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  final state = ref.read(meetingProvider);

  await FirebaseFirestore.instance.collection("rooms").doc(state.roomId).set({
    "createdBy": currentUser?.uid,
    "hostID": currentUser?.uid,
    "hostName": currentUser?.displayName,
    "timeStamp": FieldValue.serverTimestamp(),
    "roomID": state.roomId,
  });

  Navigator.pushReplacementNamed(
    context,
    '/meeting-room',
    arguments: {
      'roomId': state.roomId,
      'userName': nameController.text.trim(),
      'isMicOff': state.isMicOff,
      'isCameraOff': state.isCameraOff,
      'isHost': true,
    },
  );
}
