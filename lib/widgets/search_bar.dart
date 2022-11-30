import 'package:flutter/material.dart';
import '../utils/style.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: semiGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            onSubmitted: onSubmitted,
            style: mediumText(13),
            textAlignVertical: const TextAlignVertical(y: 0),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: whiteColor,
                ),
              ),
              suffixIcon: IconButton(
                padding: const EdgeInsets.all(7),
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: whiteColor,
                ),
                onPressed: () {
                  controller.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
              hintText: placeholder,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
