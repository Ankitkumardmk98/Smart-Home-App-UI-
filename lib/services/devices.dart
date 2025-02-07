import 'package:smart_home_app_ui/models/models.dart';

List<Devices> deviceList = <Devices>[
  Devices(
    logoPathIfOff: "assets/image/icons/bulb_off.png",
    logoPathIfOn: "assets/image/icons/bulb_on.png",
    title: "Light",
  ),
  Devices(
    logoPathIfOff: "assets/image/icons/fan_off.png",
    logoPathIfOn: "assets/image/icons/fan_on.png",
    title: "Fan",
  ),
  Devices(
    logoPathIfOff: "assets/image/icons/music_off.png",
    logoPathIfOn: "assets/image/icons/music_on.png",
    title: "Music",
  ),
  Devices(
    logoPathIfOff: "assets/image/icons/wifi_off.png",
    logoPathIfOn: "assets/image/icons/wifi_on.png",
    title: "Router",
  ),
];
