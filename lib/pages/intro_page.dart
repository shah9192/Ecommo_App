import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isRegistering = true; // To toggle between Register and Sign In
  bool isAgree = false; // To track the terms and services checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              // App Logo
              Icon(Icons.shopping_bag, size: 80, color: Colors.white),

              const SizedBox(height: 15),

              // Title
              Text(
                isRegistering ? "Register" : "Sign In",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Toggle Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => setState(() => isRegistering = true),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: isRegistering ? FontWeight.bold : FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text("|", style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () => setState(() => isRegistering = false),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: !isRegistering ? FontWeight.bold : FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Input Fields
              ..._buildFields(),

              const SizedBox(height: 15),

              // Checkbox for registration
              if (isRegistering)
                Row(
                  children: [
                    Checkbox(
                      value: isAgree,
                      onChanged: (value) {
                        setState(() => isAgree = value ?? false);
                      },
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                    ),
                    const Expanded(
                      child: Text(
                        "I agree to the Terms and Conditions",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (isRegistering && !isAgree) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please agree to terms and conditions."),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, '/shop_page');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  isRegistering ? "Register" : "Sign In",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Generate fields dynamically
  List<Widget> _buildFields() {
    if (isRegistering) {
      return [
        _buildTextField("Name"),
        const SizedBox(height: 10),
        _buildTextField("Username"),
        const SizedBox(height: 10),
        _buildTextField("Email"),
        const SizedBox(height: 10),
        _buildTextField("Password"),
        const SizedBox(height: 10),
        _buildTextField("Confirm Password"),
      ];
    } else {
      return [
        _buildTextField("Username"),
        const SizedBox(height: 10),
        _buildTextField("Password"),
      ];
    }
  }

  // Single reusable TextField widget
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[900],
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
