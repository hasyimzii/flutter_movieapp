import 'package:flutter/material.dart';
import '../utils/style.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
    required this.body,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback action;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: titleText(13),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(
                icon,
                size: 20,
              ),
              onTap: action,
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
