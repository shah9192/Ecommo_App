import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color? textColor; // Added parameter for text color
  final Color? iconColor; // Added parameter for icon color

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.textColor, // Optional text color
    this.iconColor, // Optional icon color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor ?? Colors.grey, // Use iconColor if provided
        ),
        title: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black), // Use textColor if provided
        ),
        onTap: onTap,
      ),
    );
  }
}
