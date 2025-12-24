import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/model/join_meeting_model.dart';

class JoinMeetingNotifier extends AutoDisposeNotifier<JoinMeetingModel> {
  @override
  JoinMeetingModel build() {
    return JoinMeetingModel(
      isMicOff: false,
      isCameraOff: false,
      errorMessage: null,
    );
  }

  void toggleMic(bool value) {
    state = state.copyWith(isMicOff: value);
  }

  void toggleCamera(bool value) {
    state = state.copyWith(isCameraOff: value);
  }

  void setErrorMessage(String? message) {
    state = state.copyWith(errorMessage: message);
  }
}

final joinMeetingProvider =
    NotifierProvider.autoDispose<JoinMeetingNotifier, JoinMeetingModel>(
      JoinMeetingNotifier.new,
    );
