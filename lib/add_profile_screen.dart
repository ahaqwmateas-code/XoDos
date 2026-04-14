import 'package:flutter/material.dart';
import 'package:gamepads/gamepads.dart'; // Add this for Bluetooth
import '../models/xodos_config.dart';

class AddProfileScreen extends StatefulWidget {
  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  double _currentQuality = 1;
  String? _selectedDeviceId; // Stores the found Bluetooth ID
  String _statusMessage = "No controller linked";

  // Function to scan for Bluetooth controllers
  void _scanController() async {
    try {
      List<Gamepad> controllers = await Gamepads.list();
      if (controllers.isNotEmpty) {
        setState(() {
          _selectedDeviceId = controllers.first.id;
          _statusMessage = "Linked: ${controllers.first.name}";
        });
      } else {
        setState(() {
          _statusMessage = "No controller found. Pair in settings first!";
        });
      }
    } catch (e) {
      setState(() => _statusMessage = "Scan Error: $e");
    }
  }

  void _saveAddition() {
    if (_nameController.text.isEmpty) return;

    // Now it saves the Name, Quality, AND the Bluetooth ID
    final newProfile = XodosProfile.createNew(
      name: _nameController.text,
      quality: _currentQuality.toInt(),
      deviceId: _selectedDeviceId, 
    );

    setState(() {
      userAdditions.add(newProfile);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New XoDos Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Profile Name (e.g. Pro Gaming)"),
            ),
            SizedBox(height: 20),
            Text("Quality Level: ${_currentQuality.toInt()}"),
            Slider(
              value: _currentQuality,
              min: 1,
              max: 4,
              divisions: 3,
              onChanged: (val) => setState(() => _currentQuality = val),
            ),
            Divider(),
            // --- Bluetooth Section ---
            ListTile(
              title: Text("Controller Status"),
              subtitle: Text(_statusMessage),
              trailing: ElevatedButton(
                onPressed: _scanController,
                child: Text("Scan"),
              ),
            ),
            // --------------------------
            Spacer(),
            ElevatedButton(
              onPressed: _saveAddition,
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              child: Text("Save Addition"),
            )
          ],
        ),
      ),
    );
  }
}
