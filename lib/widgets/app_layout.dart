import 'package:flutter/material.dart';
import '../utils/style.dart';

class AppLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

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
      body: SafeArea(
        child: body
      ),
    );
  }
}
