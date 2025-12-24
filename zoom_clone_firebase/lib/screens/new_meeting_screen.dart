import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/provider/new_meeting_provider.dart';
import 'package:zoom_clone_firebase/resources/start_meeting_method.dart';
import 'package:zoom_clone_firebase/utils/colors.dart';
import 'package:zoom_clone_firebase/widgets/custom_button.dart';

class NewMeetingScreen extends ConsumerStatefulWidget {
  const NewMeetingScreen({super.key});

  @override
  ConsumerState<NewMeetingScreen> createState() => _NewMeetingScreenState();
}

class _NewMeetingScreenState extends ConsumerState<NewMeetingScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meetingState = ref.watch(meetingProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('New Meeting'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Meeting ID: ${meetingState.roomId}',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              readOnly: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),

            const SizedBox(height: 24),

            SwitchListTile.adaptive(
              title: Text('Mute my microphone'),
              value: meetingState.isMicOff,
              onChanged: (val) =>
                  ref.read(meetingProvider.notifier).toggleMic(val),
            ),
            SwitchListTile.adaptive(
              title: Text('Turn off my camera'),
              value: meetingState.isCameraOff,
              onChanged: (val) =>
                  ref.read(meetingProvider.notifier).toggleCamera(val),
            ),

            const SizedBox(height: 24),

            CustomButton(
              text: 'Start Meeting',
              onPressed: () {
                startMeeting(ref, context, _nameController);
              },
            ),
          ],
        ),
      ),
    );
  }
}
