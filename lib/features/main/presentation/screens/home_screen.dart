import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../widgets/home_cover_widget.dart';
import '../widgets/movie_view_widget.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeCoverWidget(listMovies: TestData.movies,),
          SizedBox(height: 10.h),
          MovieViewWidget(title: "Popular movies", listMovies: TestData.movies),
        ],
      ),
    );
  }
}
