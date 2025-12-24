class JoinMeetingModel {
  final bool isMicOff;
  final bool isCameraOff;
  final String? errorMessage;

  JoinMeetingModel({
    required this.isMicOff,
    required this.isCameraOff,
    required this.errorMessage,
  });

  JoinMeetingModel copyWith({
    bool? isMicOff,
    bool? isCameraOff,
    String? errorMessage,
  }) {
    return JoinMeetingModel(
      isMicOff: isMicOff ?? this.isMicOff,
      isCameraOff: isCameraOff ?? this.isCameraOff,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
