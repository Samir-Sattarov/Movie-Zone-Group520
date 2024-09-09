import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core_library.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? svg;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.svg, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 45.h,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: Colors.white,
        ),
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hint.tr(),
          filled: true,
          prefixIcon: svg != null
              ? SizedBox(
                  height: 24.r,
                  width: 24.r,
                  child: Center(child: SvgPicture.asset(svg!)),
                )
              : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
          fillColor:backgroundColor?? AppStyle.darkGrey,

          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: AppStyle.middleGrey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppStyle.middleGrey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppStyle.middleGrey, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppStyle.middleGrey, width: 1),
          ),
        ),
      ),
    );
  }
}
