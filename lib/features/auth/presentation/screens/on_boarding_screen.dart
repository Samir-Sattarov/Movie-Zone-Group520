import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/widgets/button_widget.dart';
import 'sign_in_one_screen.dart';
import '../../../../resources/resources.dart';
import 'sign_up_one_screen.dart';

class OnBoardingScreen extends StatelessWidget {

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
                onTap: () {
                  Navigator.of(context).push(
                    TurnPageRoute(
                      overleafColor: Colors.red,
                      animationTransitionPoint: 0.9,
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(milliseconds: 300),
                      builder: (context) => const SignInOneScreen(),
                    ),
                  );
                },
                title: "signIn",
              ),
              SizedBox(height: 16.h),
              ButtonWidget(
                onTap: () {
                  Navigator.of(context).push(
                    TurnPageRoute(
                      overleafColor: Colors.red,
                      animationTransitionPoint: 0.9,
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(milliseconds: 300),
                      builder: (context) => const SignUpOneScreen(),
                    ),
                  );
                },
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
