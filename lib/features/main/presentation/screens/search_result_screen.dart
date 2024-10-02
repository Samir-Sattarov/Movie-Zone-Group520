import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../app_core/widgets/text_form_field_widget.dart';
import '../../../../resources/resources.dart';
import '../cubit/search_movies/search_movies_cubit.dart';
import '../widgets/movie_horizontal_card_widget.dart';

class SearchResultScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SearchResultScreen());

  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController controllerSearch = TextEditingController();
  final UseDebounce useDebounce = UseDebounce(milliseconds: 300);

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    _scrollController.addListener(listenScroll);
  }

  listenScroll() {
    final pixels = _scrollController.position.pixels;
    final maxPixels = _scrollController.position.maxScrollExtent;

    if (pixels == maxPixels) {
      print("end");
      BlocProvider.of<SearchMoviesCubit>(context)
          .loadMore(controllerSearch.text);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    useDebounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: BlocListener<SearchMoviesCubit, SearchMoviesState>(
          listener: (context, state) {
            if (state is SearchMoviesError) {
              ErrorFlushBar(state.message).show(context);
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormFieldWidget(
                    controller: controllerSearch,
                    enableAutoFocus: true,
                    hint: "Search...",
                    onChanged: (text) {
                      useDebounce.run(
                        () {
                          BlocProvider.of<SearchMoviesCubit>(context)
                              .load(text);
                        },
                      );
                    },
                    backgroundColor: const Color(0xff191B1C),
                    svg: Svgs.tSearch,
                  ),
                ),
                SizedBox(height: 20.h),
                BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
                  builder: (context, state) {
                    if (state is SearchMoviesLoading) {
                      return const LoadingWidget();
                    }

                    if (state is SearchMoviesLoaded) {
                      final movies = state.results.data;
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          controller: _scrollController,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.h),
                          itemCount: movies.length,
                          addAutomaticKeepAlives: true,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return MovieHorizontalCardWidget(
                              entity: movie,
                            )      .animate()
                                .slideX(
                              duration: 300.milliseconds,
                              delay: index >= 10
                                  ? Duration.zero
                                  : Duration(milliseconds: (index * 100).toInt()),
                              curve: Curves.linear,
                            )
                                .fadeIn();
                          },
                        ),
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
    );
  }
}
