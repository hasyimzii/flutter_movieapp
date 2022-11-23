import 'package:flutter/material.dart';
import '../utils/style.dart';

class ListContent extends StatelessWidget {
  final String leading;
  final String title;
  final String subtitle;
  final Object onTapArgs;
  final VoidCallback onDelete;

  const ListContent({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.onTapArgs,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Ink(
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
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
            trailing: IconButton(
              icon : const Icon(Icons.delete),
              iconSize: 20,
              onPressed: onDelete,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/movie_update',
              arguments: onTapArgs,
            );
          },
        ),
      ),
    );
  }
}
