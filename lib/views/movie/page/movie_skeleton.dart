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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Container(
            decoration: BoxDecoration(
              color: semiGreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Shimmer.fromColors(
              baseColor: shimmerColor,
              highlightColor: lightColor,
              child: const ListTile(
                leading: ShimmerWidget(
                  width: 40,
                  height: 90,
                  radius: 5,
                ),
                title: ShimmerWidget(
                  width: double.infinity,
                  height: 10,
                  radius: 10,
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget(
                    width: 140,
                    height: 10,
                    radius: 10,
                  ),
                ),
                trailing: ShimmerWidget(
                  width: 40,
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
