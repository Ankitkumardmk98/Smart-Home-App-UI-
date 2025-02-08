import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/constants.dart';
import 'package:smart_home_app_ui/models/models.dart';
import 'package:smart_home_app_ui/pages/profile.dart';
import 'package:smart_home_app_ui/pages/room_detail.dart';
import 'package:smart_home_app_ui/services/rooms.dart';
import 'package:smart_home_app_ui/services/devices.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Rooms? selectedRoom;
  List<Devices> selectedDevice = <Devices>[];

  @override
  void initState() {
    selectedRoom = rooms[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgcolor,
      appBar: AppBar(
        backgroundColor: appBgcolor,
        elevation: 0.0,
        title: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => const Profile(),
              ),
            );
          },
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/image/people/p1.jpg",
              height: 40,
            ),
          ),
        ),
        actions: <Widget>[
          Image.asset(
            "assets/image/menu.png",
            height: 35,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Hello, Ankit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontSize: 24,
                ),
              ),
              const Text(
                "Good to see you again!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: lightWhite,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 30),
              roomWidget(),
              const SizedBox(height: 30),
              imageSlider(),
              const SizedBox(height: 30),
              const Text(
                "Devices",
                style: TextStyle(
                  color: white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8,
                ),
                itemCount: deviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  final bool isTurnedOn =
                      selectedDevice.contains(deviceList[index]);
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isTurnedOn) {
                            selectedDevice.remove(deviceList[index]);
                          } else {
                            selectedDevice.add(deviceList[index]);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              isTurnedOn
                                  ? deviceList[index].logoPathIfOn
                                  : deviceList[index].logoPathIfOff,
                              height: 30,
                            ),
                            Text(
                              deviceList[index].title,
                              style: const TextStyle(
                                color: white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView imageSlider() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: 230,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const RoomDetail(
                        roomName: "Living Room",
                        roomCondition: "Healthy",
                        temperature: "25°C",
                        humidity: "45%",
                        light: 30,
                      ),
                    ));
              },
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/image/living_room.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: ColoredBox(
                      color: Colors.black38,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Living Room",
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: 230,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const RoomDetail(
                        roomName: "Kitchen",
                        roomCondition: "Moderate",
                        temperature: "27°C",
                        humidity: "23%",
                        light: 30,
                      ),
                    ));
              },
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/image/kitchen.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: ColoredBox(
                      color: Colors.black38,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Kitchen",
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: 230,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const RoomDetail(
                        roomName: "Guest Room",
                        roomCondition: "Bad",
                        temperature: "42°C",
                        humidity: "53%",
                        light: 16,
                      ),
                    ));
              },
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/image/guest_room.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: ColoredBox(
                      color: Colors.black38,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Guest Room",
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox roomWidget() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: rooms.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedRoom = rooms[index];
              });
            },
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: selectedRoom == rooms[index] ? themeColor : lightBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                child: Image.asset(
                  rooms[index].logoPath,
                  fit: BoxFit.cover,
                  height: 25,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
