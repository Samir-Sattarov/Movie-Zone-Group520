import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core/widgets/blur_container_widget.dart';
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
              return BlurContainerWidget(
                width: 161.w,
                height: 100.h,
                blur: 30,
                color: const Color(0xff464C4F).withOpacity(0.3),
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FittedBox(
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
