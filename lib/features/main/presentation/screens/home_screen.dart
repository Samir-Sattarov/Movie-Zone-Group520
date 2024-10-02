import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/api/firebase_auth_client.dart';
import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../locator.dart';
import '../../core/entities/set_entity.dart';
import '../cubit/genres/genres_cubit.dart';
import '../cubit/movies/movie_cubit.dart';
import '../cubit/pupular_movies/popular_movies_cubit.dart';
import '../cubit/top_rated_movies/top_rated_movies_cubit.dart';
import '../widgets/brand_view_widget.dart';
import '../widgets/genres_view_widget.dart';
import '../widgets/home_cover_widget.dart';
import '../widgets/movie_view_widget.dart';
import 'main_screen.dart';

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
    BlocProvider.of<PopularMoviesCubit>(context).load();
    BlocProvider.of<TopRatedMoviesCubit>(context).load();
    BlocProvider.of<GenresCubit>(context).load();
    // await client.signIn(email: "test1@gmail.com", password: "test1234");

    // await client.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MovieCubit, MovieState>(
            listener: (context, state) {
              if (state is MovieError) {
                ErrorFlushBar(state.message).show(context);
              }
            },
          ),
          BlocListener<PopularMoviesCubit, PopularMoviesState>(
            listener: (context, state) {
              if (state is PopularMoviesError) {
                ErrorFlushBar(state.message).show(context);
              }
            },
          ),
          BlocListener<GenresCubit, GenresState>(
            listener: (context, state) {
              if (state is GenresError) {
                ErrorFlushBar(state.message).show(context);
              }
            },
          ),
          BlocListener<TopRatedMoviesCubit, TopRatedMoviesState>(
            listener: (context, state) {
              if (state is TopRatedMoviesError) {
                ErrorFlushBar(state.message).show(context);
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                const HomeCoverWidget(),
                SizedBox(height: 10.h),

                BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
                  builder: (context, state) {
                    if (state is TopRatedMoviesLoading) {
                      return const LoadingWidget();
                    }

                    if (state is TopRatedMoviesLoaded) {
                      return MovieViewWidget(
                        title: "topRated",
                        listMovies: state.results.data,
                      );
                    }

                    return const SizedBox();
                  },
                ),

                SizedBox(height: 20.h),
                BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
                  builder: (context, state) {
                    if (state is PopularMoviesLoading) {
                      return const LoadingWidget();
                    }

                    if (state is PopularMoviesLoaded) {
                      return MovieViewWidget(
                        title: "popularMovies",
                        listMovies: state.results.data,
                      );
                    }

                    return const SizedBox();
                  },
                ),
                // ListView.separated(
                //   shrinkWrap: true,
                //   itemCount: TestData.sets.length,
                //   physics: const NeverScrollableScrollPhysics(),
                //   addAutomaticKeepAlives: true,
                //   separatorBuilder: (context, index) =>
                //       SizedBox(height: 20.h),
                //   itemBuilder: (context, index) {
                //     final entity = TestData.sets[index];
                //     return MovieViewWidget(
                //       title: entity.title,
                //       listMovies: entity.movies,
                //     );
                //   },
                // ),
                const SizedBox(height: 10),

                BlocBuilder<GenresCubit, GenresState>(
                  builder: (context, state) {
                    if (state is GenresLoading) {
                      return const LoadingWidget();
                    }

                    if (state is GenresLoaded) {
                      return GenresViewWidget(listData: state.results.data);
                    }

                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
