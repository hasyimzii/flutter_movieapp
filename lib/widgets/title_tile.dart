import 'package:flutter/material.dart';
import 'style.dart';

class TitleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String year;

  const TitleTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      title: Text(
        title,
        style: titleTextStyle,
      ),
      subtitle: Text(
        subtitle,
        style: subtitleTextStyle,
      ),
      trailing: Text(
        year,
        style: titleListTextStyle,
      ),
    );
  }
}