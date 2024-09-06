import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class BlurContainerWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double elevation;
  final double blur;
  final EdgeInsetsGeometry padding;
  final Color color;
  final BorderRadius borderRadius;
  final String? image;
  final AlignmentGeometry? imageAlignment;

  const BlurContainerWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.image,
    this.imageAlignment,
  });

  const BlurContainerWidget.square({
    super.key,
    required this.child,
    double? dimension,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.image,
    this.imageAlignment,
  })  : width = dimension,
        height = dimension;

  const BlurContainerWidget.expand({
    super.key,
    required this.child,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.image,
    this.imageAlignment,
  })  : width = double.infinity,
        height = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
                color: color,
                image: image != null
                    ? DecorationImage(
                        image: AssetImage(image!),
                        alignment: imageAlignment ?? Alignment.center,
                      )
                    : null),
            child: child,
          ),
        ),
      ),
    );
  }
}