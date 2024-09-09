import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/core/entities/user_entity.dart';

class ProfileUserWidget extends StatelessWidget {
  final UserEntity entity;
  const ProfileUserWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 72.r,
            width: 72.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff191B1C),
              border: Border.all(
                width: 1,
                color: const Color(0xff656E72),
              ),
            ),
            child: Center(
              child: Text(
                entity.name[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: const Color(0xffEEEFF0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${entity.name} ${entity.surname}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  entity.email,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xffB9BFC1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.white,
            size: 30.r,
          ),
        ],
      ),
    );
  }
}
