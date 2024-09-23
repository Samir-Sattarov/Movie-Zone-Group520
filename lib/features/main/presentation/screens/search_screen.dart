import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../../resources/resources.dart';
import '../../core/entities/set_entity.dart';
import '../cubit/genres/genres_cubit.dart';
import '../cubit/pupular_movies/popular_movies_cubit.dart';
import '../widgets/brand_view_widget.dart';
import '../widgets/genres_grid_view_widget.dart';
import '../widgets/genres_view_widget.dart';
import '../widgets/home_cover_widget.dart';
import '../widgets/movie_view_widget.dart';
import 'search_result_screen.dart';

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
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    BlocProvider.of<PopularMoviesCubit>(context).load();
    BlocProvider.of<GenresCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
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
          ],
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SearchResultScreen()));
                      },
                      child: AbsorbPointer(
                        child: TextFormFieldWidget(
                          controller: controllerSearch,
                          hint: "Search...",
                          backgroundColor: const Color(0xff191B1C),
                          svg: Svgs.tSearch,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: BlocBuilder<GenresCubit, GenresState>(
                      builder: (context, state) {
                        if (state is GenresLoading) {
                          return const LoadingWidget();
                        }

                        if (state is GenresLoaded) {
                          return GenresGridViewWidget(
                              listData: state.results.data, maxToView: 6,);
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
