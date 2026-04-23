class XodosStorageProvider {
  final String providerId;
  final int freeQuotaGB;
  final int usedGB;
  final bool isConnected;

  XodosStorageProvider({
    required this.providerId,
    this.freeQuotaGB = 15,
    this.usedGB = 0,
    this.isConnected = false,
  });

  double get usagePercent => (usedGB / freeQuotaGB) * 100;
}

final List<XodosStorageProvider> connectedClouds = [
  XodosStorageProvider(providerId: 'google', freeQuotaGB: 15, isConnected: true),
  XodosStorageProvider(providerId: 'cloudgate', freeQuotaGB: 1000, isConnected: true),
];
