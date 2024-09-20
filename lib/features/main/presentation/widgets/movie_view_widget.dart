import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/entities/movie_entity.dart';
import '../screens/movie_detail_screen.dart';

class MovieViewWidget extends StatelessWidget {
  final String title;
  final List<MovieEntity> listMovies;
  final EdgeInsets? padding;
  const MovieViewWidget({
    super.key,
    required this.title,
    required this.listMovies,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 200.h,
          width: 1.sw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemCount: listMovies.length,
            itemBuilder: (context, index) {
              final movie = listMovies[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(entity: movie),
                    ),
                  );
                },
                child: _item(movie),
              );
            },
          ),
        ),
      ],
    );
  }

  _item(MovieEntity entity) {
    return SizedBox(
      height: 200.h,
      width: 158.w,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            entity.imageUrl,
            fit: BoxFit.cover,
          ),
          // if (entity.newEpisodes == true)
          //   Positioned(
          //     top: 5.h,
          //     left: 5.w,
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(100.r)),
          //       child: Center(
          //         child: Text(
          //           'newEpisodes'.tr(),
          //           style: TextStyle(
          //             fontSize: 12.sp,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
