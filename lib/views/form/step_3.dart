import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/style.dart';

import '../../blocs/image/image_bloc.dart';

import '../../widgets/submit_button.dart';

class Step3 extends StatelessWidget {
  const Step3({
    Key? key,
    required this.isEdit,
    required this.formKey,
    required this.imageController,
    required this.openCamera,
    required this.openGallery,
  }) : super(key: key);

  final bool isEdit;
  final GlobalKey<FormState> formKey;
  final TextEditingController imageController;
  final VoidCallback openCamera;
  final VoidCallback openGallery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageInitial) {
              if (isEdit) {
                return Image.network(
                  imageController.text,
                  height: 200,
                );
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 55,
                    horizontal: 25,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.image,
                    color: semiWhiteColor,
                    size: 90,
                  ),
                );
              }
            } else if (state is ImageLoaded) {
              return Image.file(
                File(state.image.path),
                height: 200,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Failed to get image'),
                ),
              );
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.image,
                  color: semiWhiteColor,
                  size: 90,
                ),
              );
            }
          },
        ),
        const SizedBox(height: 10),
        SubmitButton(
          title: 'Camera',
          icon: Icons.photo_camera,
          onTap: openCamera,
        ),
        const SizedBox(height: 10),
        SubmitButton(
          title: 'Gallery',
          icon: Icons.photo_library,
          onTap: openGallery,
        ),
      ],
    );
  }
}
