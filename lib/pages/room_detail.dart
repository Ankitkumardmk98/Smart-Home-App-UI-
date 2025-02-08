import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/constants.dart';

class RoomDetail extends StatefulWidget {
  final String roomName;
  final String roomCondition;
  final String temperature;
  final String humidity;
  final double light;

  const RoomDetail({
    super.key,
    required this.roomName,
    required this.roomCondition,
    required this.temperature,
    required this.humidity,
    required this.light,
  });

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  bool isSwitched = false;
  double sliderValue = 0.5;

  OutlineInputBorder borderDesign = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  );

  bool isLightOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar:
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: blueGradient,
          ),
        ),
        child: Column(
          children: <Widget>[
            AppBar(
              iconTheme: const IconThemeData(
                color: white,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                Image.asset(
                  "assets/image/menu.png",
                  height: 40,
                ),
                const SizedBox(width: 10),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Text(
                      widget.roomName,
                      style: const TextStyle(
                        color: white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      widget.roomCondition,
                      style: const TextStyle(
                        color: lightWhite,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Your ${widget.roomName} is connected with your phone!",
                      style: const TextStyle(
                        color: lightWhite,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: lightBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            roomData(
                              Icons.thermostat,
                              "Temperature",
                              widget.temperature,
                            ),
                            const VerticalDivider(
                              color: Color.fromARGB(26, 238, 238, 238),
                            ),
                            roomData(
                              Icons.water_drop,
                              "Humidity",
                              widget.humidity,
                            ),
                            const VerticalDivider(
                              color: Color.fromARGB(26, 238, 238, 238),
                            ),
                            roomData(
                              Icons.light_mode,
                              "Light",
                              "${widget.light.toString()}%",
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: lightBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            "assets/image/icons/music_off.png",
                            color: themeColor,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Music",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: mediumWhite,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Tille The End - Linkin Park",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: mediumWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.skip_previous,
                                color: mediumWhite,
                                size: 25,
                              ),
                              Icon(
                                Icons.pause,
                                color: mediumWhite,
                                size: 25,
                              ),
                              Icon(
                                Icons.skip_next,
                                color: mediumWhite,
                                size: 25,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: lightBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.light_mode_outlined,
                                    color: white,
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.air,
                                    color: lightWhite,
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.water_drop,
                                    color: lightWhite,
                                  ),
                                ],
                              ),
                              Switch(
                                value: isSwitched,
                                onChanged: (bool value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                                activeColor: lightGreen,
                                activeTrackColor: darkGreen,
                                inactiveThumbColor: lightBgColor,
                                inactiveTrackColor: lightGreenOff,
                                trackOutlineColor:
                                    const WidgetStatePropertyAll<Color>(
                                        lightBgColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            widthFactor: 9,
                            child: Text(
                              "${(sliderValue * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 8,
                              activeTrackColor: themeColor,
                              inactiveTrackColor: lightGreenOff,
                              thumbColor: themeColor,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                            ),
                            child: Slider(
                              value: sliderValue,
                              onChanged: (double value) {
                                setState(() {
                                  sliderValue = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLightOn = !isLightOn;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: lightGreenOff,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    isLightOn
                                        ? "assets/image/icons/bulb_on.png"
                                        : "assets/image/icons/bulb_off.png",
                                    height: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Light",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: mediumWhite,
                                    ),
                                  ),
                                  Text(
                                    isLightOn ? "ON" : "OFF",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                      color: mediumWhite,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: lightBgColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/image/people/p1.jpg",
                                height: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/image/people/p2.jpg",
                                height: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/image/people/p1.jpg",
                                height: 50,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: lightGreenOff,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "+5",
                                style: TextStyle(
                                  color: mediumWhite,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        style: const TextStyle(
                          color: mediumWhite,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              Icons.add,
                              color: mediumWhite,
                              size: 35,
                            ),
                          ),
                          hintText: "Add New Device",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w100,
                            color: mediumWhite,
                          ),
                          fillColor: lightBgColor,
                          filled: true,
                          border: borderDesign,
                          enabledBorder: borderDesign,
                          focusedBorder: borderDesign,
                          focusedErrorBorder: borderDesign,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget roomData(IconData iconName, String condition, String value) {
    return SizedBox(
      width: 100,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(26, 238, 238, 238),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              iconName,
              color: lightWhite,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            condition,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: lightWhite,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: mediumWhite,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
