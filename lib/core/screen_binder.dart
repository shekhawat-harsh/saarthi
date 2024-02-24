import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sarthi/features/live/screen/live_page.dart';
import 'package:sarthi/features/profile/screen/profile_page.dart';
import 'package:sarthi/features/record/screen/privious_record_screen.dart';
import 'package:sarthi/services/firebase_services.dart';

class ScreenBinder extends StatefulWidget {
  const ScreenBinder({super.key});

  @override
  State<ScreenBinder> createState() => _ScreenBinderState();
}

class _ScreenBinderState extends State<ScreenBinder> {
  var screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    String text = "";
    if (screenIndex == 0) {
      text = "Live";
    } else if (screenIndex == 1) {
      text = "Records";
    } else if (screenIndex == 2) {
      text = "Profile";
    }

    Widget? myBody;
    AppBar? myAppBar;
    if (screenIndex == 0) {
      myBody = const LivePage();

      myAppBar = AppBar(title: Text(text), actions: const [
        CircleAvatar(
          backgroundColor: Colors.amber,
        )
      ]);
    } else if (screenIndex == 1) {
      myAppBar = AppBar(title: Text(text), actions: const [
        CircleAvatar(
          backgroundColor: Colors.amber,
        )
      ]);
      myBody = const PriviousRecord();
    } else if (screenIndex == 2) {
      myAppBar = AppBar(
        title: const Text('Profile Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseServices().logOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      );
      myBody = const ProfilePage();
    }
    return Scaffold(
      appBar: myAppBar,
      bottomNavigationBar: GNav(
          gap: 8,
          onTabChange: (index) {
            if (index == screenIndex) {
            } else {
              setState(() {
                screenIndex = index;
              });
            }
          },
          tabs: const [
            GButton(
              icon: Icons.play_arrow,
              text: "Live",
            ),
            GButton(
              icon: Icons.fiber_manual_record_outlined,
              text: "Records",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            )
          ]),
      body: myBody,
    );
  }
}
