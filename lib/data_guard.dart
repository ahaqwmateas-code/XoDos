import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

class DataGuard {
  static const String _storageKey = 'xodos_workstation_data';

  // 💾 SAVE: Turns the list of profiles into text and saves it to the phone
  static Future<void> saveProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = jsonEncode(
        userAdditions.map((profile) => profile.toJson()).toList(),
      );
      await prefs.setString(_storageKey, encodedData);
      print("XoDos: All profiles saved successfully.");
    } catch (e) {
      print("XoDos Save Error: $e");
    }
  }

  // 📥 LOAD: Pulls the text from the phone and turns it back into Profiles
  static Future<void> loadProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? encodedData = prefs.getString(_storageKey);
      
      if (encodedData != null) {
        final List<dynamic> decodedData = jsonDecode(encodedData);
        userAdditions = decodedData
            .map((item) => XodosProfile.fromJson(item))
            .toList();
        print("XoDos: Loaded ${userAdditions.length} profiles.");
      }
    } catch (e) {
      print("XoDos Load Error: $e");
    }
  }
}
