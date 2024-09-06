import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/entities/brand_entity.dart';
import '../../core/entities/genre_entity.dart';

class GenresViewWidget extends StatelessWidget {
  final List<GenreEntity> listData;
  const GenresViewWidget({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "genres".tr(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 100.h,
          width: 1.sw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final brand = listData[index];
              return Container(
                width: 161.w,
                height: 100.h,
                color: Colors.red,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: Image.network(
                        brand.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(

                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.10),
                            Colors.black.withOpacity(0.30),
                            Colors.black.withOpacity(0.40),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Text(
                        brand.title,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffEEEFF0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
