import 'package:flutter/material.dart';
import '../utils/style.dart';

class Description extends StatelessWidget {
  final String title;
  final String subtitle;

  const Description({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      title: Text(
        title,
        style: titleListTextStyle,
      ),
      subtitle: Text(
        subtitle,
        style: subtitleListTextStyle,
      ),
    );
  }
}
