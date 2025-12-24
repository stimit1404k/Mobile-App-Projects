class MeetingStateModel {
  final bool isMicOff;
  final bool isCameraOff;
  final String roomId;

  MeetingStateModel({
    required this.isMicOff,
    required this.isCameraOff,
    required this.roomId,
  });

  MeetingStateModel copyWith({
    bool? isMicOff,
    bool? isCameraOff,
    String? roomId,
  }) {
    return MeetingStateModel(
      isMicOff: isMicOff ?? this.isMicOff,
      isCameraOff: isCameraOff ?? this.isCameraOff,
      roomId: roomId ?? this.roomId,
    );
  }
}
