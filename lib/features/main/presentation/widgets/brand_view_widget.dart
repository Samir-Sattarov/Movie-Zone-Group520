import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/entities/brand_entity.dart';

class BrandViewWidget extends StatelessWidget {
  final List<BrandEntity> listData;
  const BrandViewWidget({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "brands".tr(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 82.h,
          width: 1.sw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final movie = listData[index];
              return Container(
                height: 82.r,
                width: 82.r,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),
                child: Image.network(movie.imageUrl, fit: BoxFit.cover,),
              );
            },
          ),
        ),
      ],
    );
  }
}
