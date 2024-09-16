import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../resources/resources.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120.r,
        height: 120.r,
        child: Center(
          child: Lottie.asset(
            Animations.tLaoding,
            frameRate: const FrameRate(120),
          ),
        ),
      ),
    );
  }
}
