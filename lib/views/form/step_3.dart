import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/style.dart';

import '../../blocs/image/image_bloc.dart';

import '../../widgets/submit_button.dart';
import '../../widgets/snackbar_widget.dart';

class Step3 extends StatelessWidget {
  const Step3({
    Key? key,
    required this.isUpdate,
    required this.imageController,
    required this.openCamera,
    required this.openGallery,
  }) : super(key: key);

  final bool isUpdate;
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
              if (isUpdate) {
                return Image.network(
                  imageController.text,
                  height: 250,
                );
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 65,
                    horizontal: 35,
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
                height: 250,
              );
            } else {
              SnackbarWidget.show(
                context,
                'Failed to get image',
              );
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 65,
                  horizontal: 35,
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
        const SizedBox(height: 20),
        Text(
          'Take Image From :',
          style: titleText(14),
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: SubmitButton(
                title: 'Camera',
                icon: Icons.photo_camera,
                onTap: openCamera,
              ),
            ),
            // const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: SubmitButton(
                title: 'Gallery',
                icon: Icons.photo_library,
                onTap: openGallery,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
