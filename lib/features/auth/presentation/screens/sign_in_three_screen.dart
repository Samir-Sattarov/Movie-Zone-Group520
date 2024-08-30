import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/widgets/button_widget.dart';

class SignInThreeScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignInThreeScreen());

  const SignInThreeScreen({super.key});

  @override
  State<SignInThreeScreen> createState() => _SignInThreeScreenState();
}

class _SignInThreeScreenState extends State<SignInThreeScreen> {
  final TextEditingController controllerOtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff656E72)),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8.r),
    );

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  height: 30.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 120.w,
                        child: LinearProgressIndicator(
                          value: 1,
                          color: Colors.white,
                          minHeight: 8.h,
                          borderRadius: BorderRadius.circular(100),
                          backgroundColor: const Color(0xff191B1C),
                        ),
                      ),
                      SizedBox(
                        width: 57.w,
                        child: ButtonWidget(
                          title: "help",
                          borderRadius: BorderRadius.circular(100),
                          textStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                          onTap: () {},
                          isOutline: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "signInThreeTitle".tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "signInThreeDescription".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppStyle.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    controller: controllerOtp,
                    keyboardType: TextInputType.number,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
                const Spacer(),
                Text(
                  "signInThreeText".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppStyle.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                ButtonWidget(
                  title: "continue",
                  onTap: () {
                    if (controllerOtp.text == "1234") {
                      // Navigator.push(context, route)
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
