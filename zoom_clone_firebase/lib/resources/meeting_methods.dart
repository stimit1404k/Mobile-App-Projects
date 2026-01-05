import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> approveUser(String roomId, String userId) async {
    try {
      await _firestore
          .collection('rooms')
          .doc(roomId)
          .collection('waiting_room')
          .doc(userId)
          .update({'status': 'approved'});
    } catch (e) {
      print("Error approving user: $e");
    }
  }

  Future<void> rejectUser(String roomId, String userId) async {
    try {
      await _firestore
          .collection('rooms')
          .doc(roomId)
          .collection('waiting_room')
          .doc(userId)
          .update({'status': 'rejected'});
    } catch (e) {
      print("Error rejecting user: $e");
    }
  }
}
