import 'dart:convert';
import 'package:http/http.dart' as http;
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

  Future<void> _submitCheckout() async {
    if (!_formKey.currentState!.validate()) return;

    final checkoutData = {
      'name': _nameController.text,
      'address': _addressController.text,
      'phone': _phoneController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:4000/checkout'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(checkoutData),
      );

      if (response.statusCode == 201) {
        _showSnackBar("Your order has been placed successfully.");
        _formKey.currentState!.reset();
        _nameController.clear();
        _addressController.clear();
        _phoneController.clear();
      } else {
        _showSnackBar('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      _showSnackBar('Network error: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Name", _nameController),
              _buildTextField("Address", _addressController),
              _buildTextField("Phone Number", _phoneController, keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitCheckout,
                child: const Text("Submit", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        keyboardType: keyboardType,
        validator: (value) => value!.isEmpty ? "Please enter $label.toLowerCase()" : null,
      ),
    );
  }
}
