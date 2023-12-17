import 'package:flutter/material.dart';

class NormalRawMaterialButton extends StatelessWidget {
  const NormalRawMaterialButton({Key? key, required this.onPressed, required this.child, required this.height, required this.width, required this.color}) : super(key: key);
  final Function() onPressed;
  final Widget child;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      highlightElevation: 0,
      constraints: BoxConstraints(
          minWidth: width,
          minHeight: height,maxHeight: height,
          maxWidth: width),
      fillColor: color ,
      elevation: 0,
      shape: RoundedRectangleBorder(
        //side: BorderSide(color: sideColor),
          borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: child,
    );
  }
}
