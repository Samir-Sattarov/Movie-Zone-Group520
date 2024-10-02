import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../app_core/utils/date_time_helper.dart';
import '../../../../app_core/widgets/blur_container_widget.dart';
import '../../core/entities/movie_entity.dart';

class InfoMovieWidget extends StatelessWidget {
  final Function() onClose;
  final MovieEntity entity;
  const InfoMovieWidget(
      {super.key, required this.onClose, required this.entity});

  @override
  Widget build(BuildContext context) {
    return BlurContainerWidget(
      height: 1.sh,
      width: 1.sw,
      blur: 50,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      color: const Color(0xff0F1111).withOpacity(0.6),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Opacity(
                      opacity: 0,
                      child: AbsorbPointer(
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30.w,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entity.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onClose,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ReadMoreText(
                  entity.description,
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
              SizedBox(height: 28.h),
              _InfoItemWidget(
                title: "releaseDate",
                value: entity.releaseDate!.year.toString(),
              ),
              // _InfoItemWidget(
              //   title: "runtime",
              //   value: DateTimeHelper.getFormattedDurationFromMinute(entity.runtime),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItemWidget extends StatelessWidget {
  final String title;
  final String value;
  const _InfoItemWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff656E72),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xffB9BFC1),
              ),
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
