import 'package:flutter/material.dart';
import 'style.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SubmitButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 20.0,
      ),
      label: Text(
        title,
        style: titleListTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        primary: redColor,
        minimumSize: const Size(double.infinity, 40),
      ),
    );
  }
}
