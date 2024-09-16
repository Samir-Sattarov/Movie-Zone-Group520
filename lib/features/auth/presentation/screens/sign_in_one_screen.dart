import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/widgets/button_widget.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import 'sign_in_two_screen.dart';

class SignInOneScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignInOneScreen());

  const SignInOneScreen({super.key});

  @override
  State<SignInOneScreen> createState() => _SignInOneScreenState();
}

class _SignInOneScreenState extends State<SignInOneScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                          value: 0.2,
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
                  "signInOneTitle".tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "signInOneDescription".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppStyle.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                TextFormFieldWidget(
                    controller: controllerEmail, hint: "enterEmail"),
                const Spacer(),
                Text(
                  "signInOneText".tr(),
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
                    Navigator.of(context).push(SignInTwoScreen.route(
                      email: controllerEmail.text,
                    ));
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
