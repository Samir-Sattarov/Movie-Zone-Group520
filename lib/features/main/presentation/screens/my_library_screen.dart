import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../widgets/movie_horizontal_card_widget.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "myLibrary".tr(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: TestData.movies.length,
                itemBuilder: (context, index) {
                  final movie = TestData.movies[index];
                  return MovieHorizontalCardWidget(
                    entity: movie,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
