enum ControllerType { virtual, bluetooth, usb }

class WorkstationProfile {
  final String id;
  final String name;
  final String host;
  final int port;
  final String protocol;
  final ControllerType controllerType;
  final bool isActive;

  WorkstationProfile({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.protocol,
    this.controllerType = ControllerType.virtual,
    this.isActive = false,
  });
}
