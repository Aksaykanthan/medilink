import 'package:flutter/material.dart';

class RoundCont extends StatelessWidget {
  const RoundCont(
      {super.key,
      this.child,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.bgColor = Colors.black,
      this.margin});

  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Color bgColor;
  final Widget? child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: bgColor,
      ),
      child: child,
    );
  }
}
