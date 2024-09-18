import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_core/widgets/blur_container_widget.dart';
import '../../../../resources/resources.dart';
import '../cubit/current_user/current_user_cubit.dart';
import 'home_screen.dart';
import 'my_library_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<CurrentUserCubit>(context).load();
    super.initState();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyLibraryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: screens[currentIndex],
      ),
      bottomNavigationBar: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 35.h),
        child: BlurContainerWidget(
          color: const Color(0xff464C4F).withOpacity(0.3),
          blur: 30,
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(0, Svgs.tHome),
                _item(1, Svgs.tSearch),
                _item(2, Svgs.tPlayer),
                _item(3, Svgs.tUser),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _item(
    int index,
    String icon,
  ) {
    return IconButton(
      onPressed: () {
        currentIndex = index;
        HapticFeedback.lightImpact();
        setState(() {});
      },
      icon: SizedBox(
        height: 24.r,
        width: 24.r,
        child: Center(
          child: SvgPicture.asset(
            icon,
            color:
                currentIndex == index ? Colors.white : const Color(0xff464C4F),
          ),
        ),
      ),
    );
  }
}
