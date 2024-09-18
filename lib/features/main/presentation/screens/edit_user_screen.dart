import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/widgets/button_widget.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../auth/core/entities/user_entity.dart';
import '../cubit/current_user/current_user_cubit.dart';

class EditUserScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EditUserScreen());

  const EditUserScreen({
    super.key,
  });

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSurname = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  late UserEntity user;

  @override
  void initState() {
    initialize();

    super.initState();
  }

  initialize() {
    user = BlocProvider.of<CurrentUserCubit>(context).user;
    controllerName.text = user.name;
    controllerSurname.text = user.surname;
    controllerEmail.text = user.email;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: BlocConsumer<CurrentUserCubit, CurrentUserState>(
          listener: (context, state) {
            if (state is CurrentUserError) {
              ErrorFlushBar(state.message).show(context);
            }
          },
          builder: (context, state) {
            if (state is CurrentUserLoading) {
              return const LoadingWidget();
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white,
                            size: 30.r,
                          ),
                        ),
                        Text(
                          "account".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        AbsorbPointer(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextFormFieldWidget(
                        controller: controllerName,
                        hint: "firstName",
                        label: "firstName",
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextFormFieldWidget(
                        controller: controllerSurname,
                        hint: "lastName",
                        label: "lastName",
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextFormFieldWidget(
                        controller: controllerEmail,
                        hint: "Email",
                        label: "Email",
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ButtonWidget(
                        title: "save",
                        onTap: () {
                          user = user.copyWith(
                            name: controllerName.text,
                            surname: controllerSurname.text,
                          );
                          BlocProvider.of<CurrentUserCubit>(context).save(user);
                        },
                      ),
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
