import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final approvedStatusProvider =
    StreamProvider.family<
      Map<String, dynamic>?,
      (String roomId, String userId)
    >((ref, args) {
      final (roomId, userId) = args;
      return FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('waiting_room')
          .doc(userId)
          .snapshots()
          .map((snapshot) {
            return snapshot.data();
          });
    });
