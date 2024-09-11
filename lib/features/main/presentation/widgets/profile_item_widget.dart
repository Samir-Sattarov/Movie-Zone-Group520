import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? prefix;
  final Widget? suffix;

  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.shade600,
        child: Ink(
          width: 1.sw,
          height: 56.h,
          decoration: BoxDecoration(
            border: prefix != null
                ? null
                : const Border(
                    bottom: BorderSide(
                      color: Color(0xff272B2C),
                      width: 1,
                    ),
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                if (prefix != null)
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: prefix,
                  ),
                Text(
                  title.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                suffix ??
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
