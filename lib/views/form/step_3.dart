import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_movieapp/utils/style.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/submit_button.dart';

class Step3 extends StatelessWidget {
  const Step3({
    Key? key,
    required this.formKey,
    required this.imageController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController imageController;
  // File? image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: semiGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.image,
                  color: semiWhiteColor,
                  size: 30,
                ),
              ),
              // Container(
              //   child: (image != null)
              //       ? Image.file(
              //           image!,
              //           scale: 50,
              //         )
              //       : Container(
              //           decoration: BoxDecoration(
              //             color: semiGreyColor,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Icon(
              //             Icons.image,
              //             color: semiWhiteColor,
              //             size: 30,
              //           ),
              //         ),
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubmitButton(
                    title: 'Camera',
                    icon: Icons.photo_camera,
                    onTap: () {},
                  ),
                  SubmitButton(
                    title: 'Gallery',
                    icon: Icons.photo_library,
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
