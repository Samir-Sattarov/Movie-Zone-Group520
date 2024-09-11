import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../widgets/movie_horizontal_card_widget.dart';
import '../widgets/profile_item_widget.dart';
import '../widgets/profile_user_widget.dart';
import 'edit_user_screen.dart';
import 'language_screen.dart';

class ProfileScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfileScreen());

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, EditUserScreen.route());
                },
                child: ProfileUserWidget(
                  entity: TestData.user,
                ),
              ),
              SizedBox(height: 52.h),
              _category("settings"),
              SizedBox(height: 8.h),
              ProfileItemWidget(
                title: "notifications",
                onTap: () {},
              ),
              ProfileItemWidget(
                title: "language",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LanguageScreen(
                        onLangChanged: () {
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 28.h),
              _category("others"),
              SizedBox(height: 8.h),
              ProfileItemWidget(
                title: "history",
                onTap: () {},
              ),
              ProfileItemWidget(
                title: "language",
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              ProfileItemWidget(
                title: "logOut",
                prefix: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _category(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        text.tr(),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffB9BFC1),
        ),
      ),
    );
  }
}
