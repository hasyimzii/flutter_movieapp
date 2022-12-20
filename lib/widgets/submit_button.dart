import 'package:flutter/material.dart';
import '../utils/style.dart';

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
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 18,
        ),
        label: Text(
          title,
          style: titleText(13),
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 40),
        ),
      ),
    );
  }
}
