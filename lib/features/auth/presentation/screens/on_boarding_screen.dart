import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app_core/app_core_library.dart';
import 'package:movie_app/app_core/widgets/button_widget.dart';
import 'package:movie_app/resources/resources.dart';

class OnBoardingScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => OnBoardingScreen());

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Images.tOnBoardingImage,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "onBoardingScreenTitle".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "onBoardingScreenDescription".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppStyle.middleGrey,
                ),
              ),
              SizedBox(height: 25.h),
              ButtonWidget(
                onTap: () {},
                title: "signIn",
              ),
              SizedBox(height: 16.h),
              ButtonWidget(
                onTap: () {},
                isOutline: true,
                title: "signUp",
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
