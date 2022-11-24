import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/style.dart';

import '../../../widgets/shimmer_widget.dart';

class MovieSkeleton extends StatelessWidget {
  const MovieSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Container(
            decoration: BoxDecoration(
              color: semiGreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Shimmer.fromColors(
              baseColor: shimmerColor,
              highlightColor: lightColor,
              child: const ListTile(
                title: ShimmerWidget(
                  width: double.infinity,
                  height: 8,
                  radius: 10,
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget(
                    width: 140,
                    height: 8,
                    radius: 10,
                  ),
                ),
                trailing: ShimmerWidget(
                  width: 50,
                  height: 8,
                  radius: 5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
