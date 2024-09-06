import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../../core/entities/set_entity.dart';
import '../widgets/brand_view_widget.dart';
import '../widgets/home_cover_widget.dart';
import '../widgets/movie_view_widget.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreen());

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              HomeCoverWidget(
                listMovies: TestData.movies,
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                shrinkWrap: true,
                itemCount: TestData.sets.length,
                physics: const NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: true,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  final entity = TestData.sets[index];
                  return MovieViewWidget(
                    title: entity.title,
                    listMovies: entity.movies,
                  );
                },
              ),
              const SizedBox(height: 10),
              BrandViewWidget(brands: TestData.brands),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
