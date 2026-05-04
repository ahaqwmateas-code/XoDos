import 'package:flutter/material.dart';
import '../models/controller_models.dart';
import '../models/cloud_models.dart';

class ServerListScreen extends StatefulWidget {
  const ServerListScreen({super.key});

  @override
  State<ServerListScreen> createState() => _ServerListScreenState();
}

class _ServerListScreenState extends State<ServerListScreen> {
  List<WorkstationProfile> servers = [
    WorkstationProfile(id: '1', name: 'Main Workstation', host: '127.0.0.1', port: 5900, protocol: 'VNC', isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XoDos Servers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud),
            onPressed: () => _showCloudStorage(),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: servers.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: servers.length,
              itemBuilder: (context, index) => _buildServerCard(servers[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addServer,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.computer, size: 64, color: Colors.lightBlue[300]),
        const SizedBox(height: 16),
        const Text('No servers configured', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _addServer,
          child: const Text('Add Server'),
        ),
      ],
    ),
  );

  Widget _buildServerCard(WorkstationProfile server) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: server.isActive ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  server.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _buildControllerChip(server.controllerType),
            ],
          ),
          const SizedBox(height: 8),
          Text('${server.host}:${server.port} • ${server.protocol}'),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(icon: Icons.play_arrow, label: 'Connect', color: Colors.green, onPressed: () => _connect(server)),
              const SizedBox(width: 8),
              _buildActionButton(icon: Icons.edit, label: 'Edit', color: Colors.orange, onPressed: () => _editServer(server)),
              const SizedBox(width: 8),
              _buildActionButton(icon: Icons.settings_remote, label: 'Controller', color: Colors.purple, onPressed: () => _configureController(server)),
              const SizedBox(width: 8),
              _buildActionButton(icon: Icons.delete, label: 'Delete', color: Colors.red, onPressed: () => _deleteServer(server)),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _buildControllerChip(ControllerType type) {
    final icons = {
      ControllerType.virtual: Icons.touch_app,
      ControllerType.bluetooth: Icons.bluetooth,
      ControllerType.usb: Icons.usb,
    };
    return Chip(
      avatar: Icon(icons[type], size: 16),
      label: Text(type.name.toUpperCase()),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required Color color, required VoidCallback onPressed}) => Expanded(
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18, color: Colors.white),
      label: Text(label, style: const TextStyle(fontSize: 12, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      ),
    ),
  );

  void _addServer() {}
  void _connect(WorkstationProfile s) {}
  void _editServer(WorkstationProfile s) {}
  void _configureController(WorkstationProfile s) {}
  void _deleteServer(WorkstationProfile s) => setState(() => servers.removeWhere((x) => x.id == s.id));
  void _showCloudStorage() => showDialog(context: context, builder: (_) => const CloudStorageDialog());
}

class CloudStorageDialog extends StatelessWidget {
  const CloudStorageDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Cloud Storage'),
    content: SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: connectedClouds.length,
        itemBuilder: (context, index) {
          final cloud = connectedClouds[index];
          return ListTile(
            leading: Icon(
              cloud.providerId == 'google' ? Icons.cloud :
              cloud.providerId == 'dropbox' ? Icons.cloud_circle :
              Icons.cloud_queue,
              color: cloud.isConnected ? Colors.green : Colors.grey,
            ),
            title: Text(cloud.providerId.toUpperCase()),
            subtitle: LinearProgressIndicator(
              value: cloud.usagePercent / 100,
              backgroundColor: Colors.grey[200],
            ),
            trailing: Text('${cloud.usedGB}/${cloud.freeQuotaGB} GB'),
          );
        },
      ),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
    ],
  );
}
