// ignore_for_file: must_be_immutable

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_style.dart';

class SuccessFlushBar extends Flushbar {
  final String msg;

  SuccessFlushBar(this.msg, {super.key});

  @override
  String? get message => msg;

  @override
  Widget get messageText => Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
        ),
      );

  @override
  FlushbarPosition get flushbarPosition => FlushbarPosition.TOP;

  @override
  Duration? get duration => const Duration(seconds: 2);

  @override
  BorderRadius? get borderRadius => BorderRadius.circular(10.r);

  @override
  Color? get leftBarIndicatorColor => Colors.green;

  @override
  Widget? get icon => const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.green,
      );

  @override
  EdgeInsets get margin => const EdgeInsets.all(8);

// @override
// BorderRadius? get borderRadius => BorderRadius.circular(8);
}
