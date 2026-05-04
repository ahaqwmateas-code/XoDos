import 'dart:io';
import 'dart:convert';
import 'package:gamepads/gamepads.dart';

enum ControllerType { virtual, bluetooth, usb }

class WorkstationProfile {
  final String id;
  final String name;
  final String host;
  final int port;
  final String? username;
  final String? password;
  final String protocol;
  final int qualityLevel;
  final ControllerType controllerType;
  final String? bluetoothDeviceId;
  final Map<String, int> buttonMapping;
  final List<XodosFile> savedFiles;
  final Map<String, String> customEnv;
  final DateTime createdAt;
  final bool isActive;

  const WorkstationProfile({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.protocol,
    this.username,
    this.password,
    this.qualityLevel = 1,
    this.controllerType = ControllerType.virtual,
    this.bluetoothDeviceId,
    this.buttonMapping = const {},
    this.savedFiles = const [],
    this.customEnv = const {},
    required this.createdAt,
    this.isActive = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'host': host,
    'port': port,
    'protocol': protocol,
    'quality': qualityLevel,
    'controller': controllerType.index,
    'deviceId': bluetoothDeviceId,
    'mapping': buttonMapping,
    'env': customEnv,
    'createdAt': createdAt.toIso8601String(),
    'isActive': isActive,
  };

  factory WorkstationProfile.fromJson(Map<String, dynamic> json) {
    final controllerIndex = json['controller'] ?? 0;
    final safeIndex = (controllerIndex >= 0 && controllerIndex < ControllerType.values.length) 
        ? controllerIndex : 0;
    
    return WorkstationProfile(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      host: json['host'] ?? '',
      port: json['port'] ?? 0,
      protocol: json['protocol'] ?? 'VNC',
      qualityLevel: json['quality'] ?? 1,
      controllerType: ControllerType.values[safeIndex],
      bluetoothDeviceId: json['deviceId'],
      buttonMapping: Map<String, int>.from(json['mapping'] ?? {}),
      customEnv: Map<String, String>.from(json['env'] ?? {}),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      isActive: json['isActive'] ?? false,
    );
  }

  WorkstationProfile copyWith({
    String? id, String? name, String? host, int? port,
    String? username, String? password, String? protocol,
    int? qualityLevel, ControllerType? controllerType,
    String? bluetoothDeviceId, Map<String, int>? buttonMapping,
    List<XodosFile>? savedFiles, Map<String, String>? customEnv,
    DateTime? createdAt, bool? isActive,
  }) => WorkstationProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    host: host ?? this.host,
    port: port ?? this.port,
    username: username ?? this.username,
    password: password ?? this.password,
    protocol: protocol ?? this.protocol,
    qualityLevel: qualityLevel ?? this.qualityLevel,
    controllerType: controllerType ?? this.controllerType,
    bluetoothDeviceId: bluetoothDeviceId ?? this.bluetoothDeviceId,
    buttonMapping: buttonMapping ?? this.buttonMapping,
    savedFiles: savedFiles ?? this.savedFiles,
    customEnv: customEnv ?? this.customEnv,
    createdAt: createdAt ?? this.createdAt,
    isActive: isActive ?? this.isActive,
  );
}

class XodosFile {
  final String id;
  final String name;
  final int totalSize;
  final List<XodosFileChunk> chunks;
  final String masterKey;
  final DateTime createdAt;

  XodosFile({
    required this.id,
    required this.name,
    required this.totalSize,
    required this.chunks,
    required this.masterKey,
    required this.createdAt,
  });
}

class XodosFileChunk {
  final String chunkId;
  final String fileId;
  final String providerId;
  final String remotePath;
  final int size;
  final String checksum;
  final String encryptionKey;

  XodosFileChunk({
    required this.chunkId,
    required this.fileId,
    required this.providerId,
    required this.remotePath,
    required this.size,
    required this.checksum,
    required this.encryptionKey,
  });
}

