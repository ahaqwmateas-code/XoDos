class XodosStorageProvider {
  final String providerId;     
  final String? oauthToken;
  final int freeQuotaGB;
  final int usedGB;
  final bool isConnected;

  XodosStorageProvider({
    required this.providerId,
    this.oauthToken,
    this.freeQuotaGB = 15,
    this.usedGB = 0,
    this.isConnected = false,
  });

  int get remainingGB => freeQuotaGB - usedGB;
  double get usagePercent => (usedGB / freeQuotaGB) * 100;
}

final List<XodosStorageProvider> connectedClouds = [
  XodosStorageProvider(providerId: 'google', freeQuotaGB: 15),
  XodosStorageProvider(providerId: 'onedrive', freeQuotaGB: 5),
  XodosStorageProvider(providerId: 'dropbox', freeQuotaGB: 2),
  XodosStorageProvider(providerId: 'cloudgate', freeQuotaGB: 1000), 
];

