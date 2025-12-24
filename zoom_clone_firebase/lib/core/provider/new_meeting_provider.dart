import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/model/meeting_state_model.dart';

class MeetingNotifier extends AutoDisposeNotifier<MeetingStateModel> {
  @override
  MeetingStateModel build() {
    return MeetingStateModel(
      isMicOff: false,
      isCameraOff: false,
      // TODO: Later add uuid package to generate unique room ids
      roomId: Random().nextInt(100000000).toString(),
    );
  }

  void toggleMic(bool value) {
    state = state.copyWith(isMicOff: value);
  }

  void toggleCamera(bool value) {
    state = state.copyWith(isCameraOff: value);
  }
}

final meetingProvider = NotifierProvider.autoDispose<MeetingNotifier, MeetingStateModel>(
  MeetingNotifier.new,
);