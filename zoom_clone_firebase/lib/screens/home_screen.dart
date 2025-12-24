import 'package:flutter/material.dart';
import 'package:zoom_clone_firebase/utils/colors.dart';
import 'package:zoom_clone_firebase/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Zoom Clone - PookieeStimit',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeMeetingButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new-meeting');
                  },
                  icon: Icons.videocam,
                  text: 'New Meeting',
                ),
                HomeMeetingButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/join-meeting');
                  },
                  icon: Icons.add_box_rounded,
                  text: 'Join Meeting',
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.calendar_today,
                  text: 'Schedule',
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.arrow_upward_rounded,
                  text: 'Share Screen',
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to Zoom Clone!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        onTap: onPageChanged,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
