import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/entities/language_entity.dart';
import '../widgets/profile_item_widget.dart';

class LanguageScreen extends StatefulWidget {
  final Function() onLangChanged;
  const LanguageScreen({super.key, required this.onLangChanged});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<LanguageEntity> languages = [
    const LanguageEntity(
      title: "United states (US)",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Flag_of_the_United_States.png/800px-Flag_of_the_United_States.png",
      langCode: 'en',
    ),
    const LanguageEntity(
      title: "Russian (RU)",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_Russia.png",
      langCode: 'ru',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 30.r,
                  ),
                ),
                Text(
                  "language".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                AbsorbPointer(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final entity = languages[index];
                  final isActive =
                      context.locale.languageCode == entity.langCode;
                  return ProfileItemWidget(
                    title: entity.title,
                    prefix: SizedBox(
                      width: 28.w,
                      height: 20.h,
                      child: Image.network(
                        entity.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      context.setLocale(Locale(entity.langCode));
                      widget.onLangChanged.call();

                      print("${context.locale}");
                      setState(() {});
                    },
                    suffix: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                            color: isActive
                                ? Colors.white
                                : const Color(0xff656E72),
                            width: 2.r),
                      ),
                      child: isActive
                          ? Container(
                              margin: EdgeInsets.all(3.r),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
