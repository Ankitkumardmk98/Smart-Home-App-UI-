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
    Size mediaQuery = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double imageSize = constraints.maxWidth;
                    double maxHeight = mediaQuery.height / 3;
                    double finalSize =
                        imageSize > maxHeight ? maxHeight : imageSize;

                    return ClipOval(
                      child: Image.asset(
                        "assets/image/people/p1.jpg",
                        width: finalSize,
                        height: finalSize,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Welcome, Ankit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mediumWhite,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "About Me ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '''
I'm Ankit Kumar, a self-taught developer on an exciting journey to mastering Flutter for cross-platform app development. My passion for coding drives me to explore new technologies, build projects, and contribute to the tech community.

🌱 What I’m Learning

Flutter & Dart: Creating beautiful and responsive apps for Android, iOS, and beyond.

Python: I’ve learned the basics and continue to explore its potential in development.
''',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mediumWhite,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "~ Thank You",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: lightWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
