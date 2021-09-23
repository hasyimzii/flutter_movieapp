import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String image;

  const PosterImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        height: 200,
      ),
    );
  }
}
