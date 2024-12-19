import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TextEditingController _hostController = TextEditingController();
  String data = "No data loaded";

  @override
  void initState() {
    super.initState();
    loadSettings(); // Load saved host when the widget is initialized
  }

  // Save host in shared preferences
  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String host = _hostController.text.trim();

    if (host.isNotEmpty) {
      await prefs.setString('host', host);  // Save host value
      setState(() {
        data = "Settings saved: Host = $host";  // Update UI with saved data
      });
    } else {
      setState(() {
        data = "Host cannot be empty.";  // Error message if host is empty
      });
    }
  }

  // Load saved host from shared preferences
  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final host = prefs.getString('host') ?? '';  // Get saved host or empty string

    setState(() {
      _hostController.text = host;  // Set text in controller to the saved host
      data = host.isEmpty ? "No host found, please set one." : "Loaded: Host = $host";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Host"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _hostController,
              decoration: const InputDecoration(
                labelText: "Host",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveSettings, // Save the host to shared preferences
              child: const Text("Save Settings"),
            ),
            const SizedBox(height: 16),
            Text(
              "Response:",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data,  // Display the current status or error
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
