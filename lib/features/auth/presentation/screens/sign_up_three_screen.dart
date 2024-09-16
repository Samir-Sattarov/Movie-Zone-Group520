import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/widgets/button_widget.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../main/presentation/screens/main_screen.dart';
import '../cubit/sign_up/sign_up_cubit.dart';
import 'sign_in_two_screen.dart';

class SignUpThreeScreen extends StatefulWidget {
  static route({
    required String name,
    required String email,
  }) =>
      MaterialPageRoute(
          builder: (context) => SignUpThreeScreen(
                name: name,
                email: email,
              ));

  final String name;
  final String email;

  const SignUpThreeScreen({super.key, required this.name, required this.email});

  @override
  State<SignUpThreeScreen> createState() => _SignUpThreeScreenState();
}

class _SignUpThreeScreenState extends State<SignUpThreeScreen> {
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              ErrorFlushBar(state.message).show(context);
            }
            if (state is SignUpSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ));
            }
          },
          builder: (context, state) {
            if (state is SignUpLoading) {
              return const LoadingWidget();
            }
            return SafeArea(
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
                      "signUpThreeTitle".tr(),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "signUpThreeDescription".tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppStyle.grey,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextFormFieldWidget(
                      controller: controllerPassword,
                      hint: "createYourPassword",
                    ),
                    const Spacer(),
                    Text(
                      "signUpThreeText".tr(),
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
                        BlocProvider.of<SignUpCubit>(context).signUp(
                          email: widget.email,
                          password: controllerPassword.text,
                          name: widget.name,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
