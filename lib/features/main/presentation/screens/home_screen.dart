import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/api/firebase_auth_client.dart';
import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../locator.dart';
import '../../core/entities/set_entity.dart';
import '../cubit/movies/movie_cubit.dart';
import '../widgets/brand_view_widget.dart';
import '../widgets/genres_view_widget.dart';
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
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    BlocProvider.of<MovieCubit>(context).load();
    // await client.signIn(email: "test1@gmail.com", password: "test1234");

    // await client.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              HomeCoverWidget(
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                shrinkWrap: true,
                itemCount: TestData.sets.length,
                physics: const NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: true,
                separatorBuilder: (context, index) =>
                    SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  final entity = TestData.sets[index];
                  return MovieViewWidget(
                    title: entity.title,
                    listMovies: entity.movies,
                  );
                },
              ),
              const SizedBox(height: 10),
              const BrandViewWidget(listData: TestData.brands),
              const SizedBox(height: 10),
              const GenresViewWidget(listData: TestData.genres),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
