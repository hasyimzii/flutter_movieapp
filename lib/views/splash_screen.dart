import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/home_page'),
    );
    
    return Center(
      child: Icon(
        Icons.movie_filter_rounded,
        size: 100,
        color: redColor,
      ),
    );
  }
}
