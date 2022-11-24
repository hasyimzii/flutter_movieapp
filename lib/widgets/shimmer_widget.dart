import 'package:flutter/material.dart';
import '../utils/style.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
