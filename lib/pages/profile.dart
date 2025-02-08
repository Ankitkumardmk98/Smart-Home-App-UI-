import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: white,
        ),
        backgroundColor: appBgcolor,
        elevation: 0.0,
        actions: <Widget>[
          Image.asset(
            "assets/image/menu.png",
            height: 40,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Column(
        children: <Widget>[
          Text(
            "Hello",
            style: TextStyle(
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
