// For Rooms
class Rooms {
  String logoPath;

  Rooms({
    required this.logoPath,
  });
}

// For Devices
class Devices {
  String logoPathIfOn;
  String logoPathIfOff;
  String title;

  Devices({
    required this.logoPathIfOn,
    required this.logoPathIfOff,
    required this.title,
  });
}
