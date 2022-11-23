import 'package:flutter/material.dart';
import '../utils/style.dart';

class Content extends StatelessWidget {
  final List<Widget> body;
  final IconData topIcon;

  const Content({
    Key? key,
    required this.body,
    required this.topIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: body,
          ),
        ),
        Positioned(
          top: -28,
          right: 28,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: redColor,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            child: Icon(
              topIcon,
              size: 28,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
