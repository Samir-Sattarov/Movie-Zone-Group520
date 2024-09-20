import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/utils/date_time_helper.dart';
import '../../../../app_core/widgets/blur_container_widget.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../core/entities/movie_entity.dart';
import '../cubit/movies/movie_cubit.dart';

class HomeCoverWidget extends StatefulWidget {
  const HomeCoverWidget({super.key});

  @override
  State<HomeCoverWidget> createState() => _HomeCoverWidgetState();
}

class _HomeCoverWidgetState extends State<HomeCoverWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state is MovieError) {
          ErrorFlushBar(state.message).show(context);
        }
      },
      builder: (context, state) {
        if (state is MovieLoading) {
          return Container(
            constraints: BoxConstraints(maxHeight: 500.h, minWidth: 1.sw),
            child: const LoadingWidget(),
          );
        }

        if (state is MovieLoaded) {
          final movies = state.entity.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(maxHeight: 500.h, minWidth: 1.sw),
            child: Stack(
              children: [
                Swiper(
                  itemCount: movies.length,
                  autoplay: true,
                  duration: 300,
                  loop: true,
                  autoplayDelay: 1500,
                  onIndexChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return _item(movie, index);
                  },
                ),
                Positioned(
                  child: _indicators(movies),
                  bottom: 20.h,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          );
        }

        return SizedBox();
      },
    );
  }

  _item(MovieEntity entity, int index) {
    currentIndex = index;

    return Stack(
      children: [
        SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Image.network(
            entity.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlurContainerWidget(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 5.h,
                          ),
                          color:  const Color(0xff272B2C).withOpacity(0.6),
                          child: Text(
                            entity.releaseDate.year.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  BlurContainerWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    color:  const Color(0xff272B2C).withOpacity(0.6),
                    
                    child: Text(
                      entity.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _indicators(List<MovieEntity> movies) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        movies.length,
        (index) {
          return Container(
            height: 6.r,
            width: 6.r,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex != index ? AppStyle.darkGrey : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
