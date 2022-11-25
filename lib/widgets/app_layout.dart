import 'package:flutter/material.dart';
import '../utils/style.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
    required this.title,
    required this.floatingButton,
    required this.body,
  }) : super(key: key);

  final String title;
  final Widget floatingButton;
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
      ),
      floatingActionButton: floatingButton,
      body: body,
    );
  }
}
