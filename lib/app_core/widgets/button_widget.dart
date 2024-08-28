import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app_core/app_core_library.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isOutline;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  const ButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    this.isOutline = false,
    this.textStyle,
    this.borderRadius,
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
            color: onTap == null
                ? AppStyle.darkGrey
                : isOutline
                    ? Colors.transparent
                    : Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(8.r),
            border: isOutline && onTap != null
                ? Border.all(
                    color: Colors.white,
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              title.tr(),
              style: textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w600,
                    color: onTap == null
                        ? AppStyle.middleGrey
                        : !isOutline
                            ? AppStyle.dark
                            : Colors.white,
                    fontSize: 16.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
