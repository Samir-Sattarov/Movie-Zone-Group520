import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/utils/date_time_helper.dart';
import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/button_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../core/entities/language_entity.dart';
import '../../core/entities/movie_entity.dart';
import '../cubit/top_rated_movies/top_rated_movies_cubit.dart';
import '../widgets/info_movie_widget.dart';
import '../widgets/movie_view_widget.dart';
import '../widgets/profile_item_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieEntity entity;
  const MovieDetailScreen({super.key, required this.entity});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _posterView(widget.entity),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ButtonWidget(
                      title: "startWatching",
                      prefix: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 30.r,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ReadMoreText(
                      widget.entity.description,
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      colorClickableText: Colors.white,
                      trimCollapsedText: 'showMore'.tr(),
                      trimExpandedText: 'showLess'.tr(),
                      moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xffB9BFC1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _trailer(widget.entity),
                  SizedBox(height: 20.h),
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
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.linearToEaseOut,
              switchOutCurve: Curves.linearToEaseOut,
              child: showInfo
                  ? InfoMovieWidget(
                      key: const ValueKey(1),
                      onClose: () {
                        showInfo = false;
                        setState(() {});
                      },
                    )
                  : SizedBox(
                      key: const ValueKey(2),
                      height: 1.sh,
                      width: 1.sw,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _trailer(MovieEntity entity) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 100.h,
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 150.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.entity.imageUrl,
                  ),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'trailer'.tr(),
                    style: TextStyle(
                      color: const Color(0xffB9BFC1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      entity.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Text(
                  //   DateTimeHelper.getFormattedDurationFromMinute(
                  //     entity.duration,
                  //   ),
                  //   style: TextStyle(
                  //     color: const Color(0xffB9BFC1),
                  //     fontSize: 16.sp,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _posterView(MovieEntity entity) {
    return SizedBox(
      width: 1.sw,
      height: 400.h,
      child: Stack(
        children: [
          AbsorbPointer(
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Image.network(
                entity.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AbsorbPointer(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54,
                    Colors.black45,
                    Colors.black26,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    AppStyle.dark.withOpacity(0.3),
                    AppStyle.dark,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 320.w,
              child: Center(
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 57.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 15.w,
                          //     vertical: 5.h,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(100.r),
                          //     color: const Color(0xff272B2C),
                          //   ),
                          //   child: FittedBox(
                          //     child: Center(
                          //       child: Text(
                          //         "${entity.age}+",
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 12.sp,
                          //           color: const Color(0xff747E83),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        if(entity.releaseDate != null)  Text(
                            entity.releaseDate!.year.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   DateTimeHelper.getFormattedDurationFromMinute(
                          //       entity.duration),
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 16.sp,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        entity.description,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: const Color(0xffB9BFC1),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      size: 30.r,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30.r,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {
                      print("test");
                      showInfo = true;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.info_outline_rounded,
                      size: 30.r,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
