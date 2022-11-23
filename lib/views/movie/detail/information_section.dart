import 'package:flutter/material.dart';
import '../../../utils/style.dart';

class Information extends StatelessWidget {
  final String rating;
  final String runtime;
  final String age;

  const Information({
    Key? key,
    required this.rating,
    required this.runtime,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: semiWhiteColor,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rating',
                  style: subtitleText(12),
                ),
                Text(
                  rating,
                  style: titleText(12),
                ),
              ],
            ),
            const VerticalDivider(thickness: 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Runtime',
                  style: subtitleText(12),
                ),
                Text(
                  runtime,
                  style: titleText(12),
                ),
              ],
            ),
            const VerticalDivider(thickness: 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Age',
                  style: subtitleText(12),
                ),
                Text(
                  age,
                  style: titleText(12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
