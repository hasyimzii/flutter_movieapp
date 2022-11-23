import 'package:flutter/material.dart';
import '../utils/style.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key? key,
    required this.image,
    required this.panel,
  }) : super(key: key);

  final String image;
  final Widget panel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            height: 200,
          ),
        ),
        const SizedBox(height: 40),
        Stack(
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
              child: panel,
            ),
            Positioned(
              top: -28,
              right: 28,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                ),
                child: const Icon(
                  Icons.bookmark,
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
