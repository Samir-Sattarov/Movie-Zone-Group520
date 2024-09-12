import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../../resources/resources.dart';
import '../widgets/movie_horizontal_card_widget.dart';

class SearchResultScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SearchResultScreen());

  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextFormFieldWidget(
                  controller: controllerSearch,
                  enableAutoFocus: true,
                  hint: "Search...",
                  backgroundColor: const Color(0xff191B1C),
                  svg: Svgs.tSearch,
                ),
              ),
              SizedBox(height: 20.h),
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
      ),
    );
  }
}
