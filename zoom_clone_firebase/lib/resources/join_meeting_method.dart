import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/provider/join_meeting_provider.dart';
import 'package:zoom_clone_firebase/utils/utils.dart';

void joinMeetingMethod(
  WidgetRef ref,
  BuildContext context,
  TextEditingController meetingIdController,
  TextEditingController nameController,
) async {
  final meetingId = meetingIdController.text.trim();
  final userName = nameController.text.trim();

  final currUser = FirebaseAuth.instance.currentUser;
  final notifier = ref.read(joinMeetingProvider.notifier);
  final state = ref.read(joinMeetingProvider);

  if (meetingId.isEmpty || userName.isEmpty) {
    notifier.setErrorMessage('Meeting ID and Name cannot be empty.');
    return;
  }

  final doc = await FirebaseFirestore.instance
      .collection("rooms")
      .doc(meetingId)
      .get();

  if (!doc.exists) {
    notifier.setErrorMessage('No meeting found with this ID.');
    showSnackBar(context, 'No meeting found with this ID.');
    return;
  }

  await FirebaseFirestore.instance
      .collection("rooms")
      .doc(meetingId)
      .collection("waiting_room")
      .doc(currUser!.uid)
      .set({"name": userName, "status": "pending"});

  Navigator.pushNamed(
    context,
    '/waiting-approval',
    arguments: {
      'roomId': meetingId,
      'userName': userName,
      'isMicOff': state.isMicOff,
      'isCameraOff': state.isCameraOff,
    },
  );

  showSnackBar(context, "Waiting to approve from Admin");
}
