import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const ShimmerWidget.rectangular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder()})
      : super(key: key);

  const ShimmerWidget.circular(
      {Key? key,
      required this.width,
      required this.height,
      required this.shapeBorder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
        baseColor: theme.primaryColor.withAlpha(50),
        highlightColor: theme.primaryColor.withAlpha(100),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: theme.primaryColor.withOpacity(.6),
            shape: shapeBorder,
          ),
        ));
  }
}
