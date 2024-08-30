import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app_core/app_core_library.dart';
import '../../core/entities/movie_entity.dart';

class HomeCoverWidget extends StatefulWidget {
  final List<MovieEntity> listMovies;
  const HomeCoverWidget({super.key, required this.listMovies});

  @override
  State<HomeCoverWidget> createState() => _HomeCoverWidgetState();
}

class _HomeCoverWidgetState extends State<HomeCoverWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 420.h, minWidth: 1.sw),
      child: PageView.builder(
        itemCount: widget.listMovies.length,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final movie = widget.listMovies[index];

          return _item(movie, index);
        },
      ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: const Color(0xff272B2C),
                          ),
                          child: FittedBox(
                            child: Center(
                              child: Text(
                                "${entity.age}+",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: const Color(0xff747E83),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          entity.releaseDate.year.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "3h 1m",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                  SizedBox(height: 30.h),
                  _indicators(),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _indicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.listMovies.length,
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
