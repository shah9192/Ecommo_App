import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> submitCheckout() async {
    if (_formKey.currentState!.validate()) {
      // Data to send to API
      final checkoutData = {
        'name': _nameController.text,
        'address': _addressController.text,
        'phone': _phoneController.text,
      };

      // Send data to API
      try {
        final response = await http.post(
          Uri.parse('http://127.0.0.1:3000/checkout'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(checkoutData),
        );

        if (response.statusCode == 201) {
          // Show success message as a popup dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Congratulations!"),
                content: const Text("Your order has been placed successfully."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      _formKey.currentState!.reset(); // Reset the form
                      _nameController.clear();
                      _addressController.clear();
                      _phoneController.clear();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          // Handle API error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.reasonPhrase}')),
          );
        }
      } catch (e) {
        // Handle network error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) =>
                value!.isEmpty ? "Please enter your address" : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty
                    ? "Please enter your phone number"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitCheckout,
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
