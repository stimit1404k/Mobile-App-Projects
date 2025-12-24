import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone_firebase/core/provider/join_meeting_provider.dart';
import 'package:zoom_clone_firebase/core/provider/new_meeting_provider.dart';
import 'package:zoom_clone_firebase/resources/join_meeting_method.dart';
import 'package:zoom_clone_firebase/utils/colors.dart';
import 'package:zoom_clone_firebase/widgets/custom_button.dart';

class JoinMeetingScreen extends ConsumerStatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  ConsumerState<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends ConsumerState<JoinMeetingScreen> {
  late TextEditingController _nameController;
  late TextEditingController _meetingIdController;

  @override
  void initState() {
    _meetingIdController = TextEditingController();
    _nameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    _meetingIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meetingState = ref.watch(joinMeetingProvider);
    final notifier = ref.read(joinMeetingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Join a Meeting'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _meetingIdController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: meetingState.errorMessage,
                border: OutlineInputBorder(),
                hintText: 'Meeting ID: ',
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

            Text('Meeting Options', style: TextStyle(fontSize: 18)),
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
              text: 'Join Meeting',
              onPressed: () {
                joinMeetingMethod(
                  ref,
                  context,
                  _meetingIdController,
                  _nameController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
