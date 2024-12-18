import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:farm_link_ai/ui/commons/nav_bar/NavBar.dart';
import 'package:farm_link_ai/consts/host.dart'; // Replace with your actual host

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formInfo = {
    "name": "",
    "phone": "",
    "email": "",
    "subject": "",
    "message": "",
  };

  bool _isLoading = false; // To track the loading state

  Future<void> handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      // Form is not valid, stop the submission process
      return;
    }

    // Save the form fields to the `_formInfo` map
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true; // Start the loading indicator
    });

    try {
      // Send the data to the backend using Dio
      final dio = Dio();


      // Handle the response
      if (200 == 200) {
        // Successfully submitted
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form submitted successfully!")),
        );
        _formKey.currentState!.reset();
      } else {
        // Handle error responses
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to submit the form. Please try again.")),
        );
      }
    } catch (e) {
      // Handle network or server errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false; // Stop the loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavBar(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Get in Touch",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF404A3D),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We'd love to hear from you! Please fill out the form below and we'll get back to you as soon as possible.",
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      ..._buildTextFormFields(),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF404A3D),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                            ),
                          )
                              : const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFormFields() {
    return [
      _buildField(
        label: "Enter your name",
        key: "name",
        validator: (value) => value!.isEmpty ? "Please enter your name." : null,
      ),
      _buildField(
        label: "Enter your contact number",
        key: "phone",
        validator: (value) {
          if (value!.isEmpty) return "Please enter your contact number.";
          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
            return "Please enter a valid 10-digit phone number.";
          }
          return null;
        },
      ),
      _buildField(
        label: "Enter your email id",
        key: "email",
        validator: (value) {
          if (value!.isEmpty) return "Please enter your email.";
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return "Please enter a valid email.";
          }
          return null;
        },
      ),
      _buildField(
        label: "Enter Subject",
        key: "subject",
        validator: (value) => value!.isEmpty ? "Please enter a subject." : null,
      ),
      _buildField(
        label: "Your Message",
        key: "message",
        maxLines: 5,
        validator: (value) =>
        value!.isEmpty ? "Please enter your message." : null,
      ),
    ];
  }

  Widget _buildField({
    required String label,
    required String key,
    int maxLines = 1,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        maxLines: maxLines,
        validator: validator,
        onSaved: (value) => _formInfo[key] = value!,
      ),
    );
  }
}
