import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app_core/app_core_library.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isOutline;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.4),
        child: Ink(
          width: 1.sw,
          height: 43.h,
          decoration: BoxDecoration(
            color: isOutline ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: isOutline
                ? Border.all(
                    color: Colors.white,
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              title.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: !isOutline ? AppStyle.dark : Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
