import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_core/cubits/network/network_cubit.dart';
import 'app_core/utils/app_style.dart';
import 'features/auth/presentation/screens/on_boarding_screen.dart';
import 'locator.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool splashActive = true;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {}

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            fontFamily: "SFProDisplay",
            primarySwatch: Colors.red,
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: AppStyle.dark,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),

            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),
            highlightColor: Colors.transparent,
          ),
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
