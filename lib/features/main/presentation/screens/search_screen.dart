import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../../resources/resources.dart';
import '../../core/entities/set_entity.dart';
import '../widgets/brand_view_widget.dart';
import '../widgets/genres_grid_view_widget.dart';
import '../widgets/genres_view_widget.dart';
import '../widgets/home_cover_widget.dart';
import '../widgets/movie_view_widget.dart';

class SearchScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SearchScreen());

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  TextFormFieldWidget(
                    controller: controllerSearch,
                    hint: "Search...",
                    backgroundColor: const Color(0xff191B1C),
                    svg: Svgs.tSearch,
                  ),
                  SizedBox(height: 20.h),
                  const GenresGridViewWidget(
                    listData: TestData.genres,
                    maxToView: 6,
                  ),

                  SizedBox(height: 32.h),

                  MovieViewWidget(
                    padding: EdgeInsets.zero,
                    title: "suggestedForYou",
                    listMovies: TestData.movies,
                  ),
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   itemCount: TestData.sets.length,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   addAutomaticKeepAlives: true,
                  //   separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  //   itemBuilder: (context, index) {
                  //     final entity = TestData.sets[index];
                  //     return MovieViewWidget(
                  //       title: entity.title,
                  //       listMovies: entity.movies,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
