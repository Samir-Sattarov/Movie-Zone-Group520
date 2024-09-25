import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/utils/date_time_helper.dart';
import '../../../../resources/resources.dart';
import '../../core/entities/movie_entity.dart';
import '../screens/movie_detail_screen.dart';

class MovieHorizontalCardWidget extends StatelessWidget {
  final MovieEntity entity;
  final Widget? suffix;
  const MovieHorizontalCardWidget(
      {super.key, required this.entity, this.suffix});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(entity: entity),
          ),
        );
      },
      child: Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 20.w, right: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
              width: 140.w,
              child: Image.network(
                entity.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  Expanded(
                    child: Text(
                      entity.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      entity.description,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  FittedBox(
                    child: Text(
                      "${entity.releaseDate}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 21.w),
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Image.asset(Images.tMenu),
            ),
          ],
        ),
      ),
    );
  }
}
