import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/widgets/blur_container_widget.dart';

class InfoMovieWidget extends StatelessWidget {
  final Function() onClose;
  const InfoMovieWidget({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return BlurContainerWidget(
      height: 1.sh,
      width: 1.sw,
      blur: 10,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      color: Colors.grey.shade600.withOpacity(0.6),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onClose,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30.w,
                    ),
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
