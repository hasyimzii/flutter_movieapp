import 'package:flutter/material.dart';
import 'style.dart';

class ListContent extends StatelessWidget {
  final String leading;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ListContent({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(leading),
          ),
          title: Text(
            title,
            style: titleListTextStyle,
          ),
          subtitle: Text(
            subtitle,
            style: subtitleListTextStyle,
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 40,
          ),
        ),
      ),
    );
  }
}
