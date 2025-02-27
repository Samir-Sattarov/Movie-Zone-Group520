import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_core/utils/app_style.dart';
import 'app_core/widgets/loading_widget.dart';
import 'features/auth/core/datasources/auth_local_data_source.dart';
import 'features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/cubit/sign_in/sign_in_cubit.dart';
import 'features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'features/auth/presentation/screens/on_boarding_screen.dart';
import 'features/main/presentation/cubit/current_user/current_user_cubit.dart';
import 'features/main/presentation/cubit/genres/genres_cubit.dart';
import 'features/main/presentation/cubit/movies/movie_cubit.dart';
import 'features/main/presentation/cubit/network_cubit/network_cubit.dart';
import 'features/main/presentation/cubit/pupular_movies/popular_movies_cubit.dart';
import 'features/main/presentation/cubit/search_movies/search_movies_cubit.dart';
import 'features/main/presentation/cubit/top_rated_movies/top_rated_movies_cubit.dart';
import 'features/main/presentation/screens/home_screen.dart';
import 'features/main/presentation/screens/main_screen.dart';
import 'locator.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late NetworkCubit networkCubit;
  late SignUpCubit signUpCubit;
  late SignInCubit signInCubit;
  late AuthCubit authCubit;
  late CurrentUserCubit currentUserCubit;
  late AuthLocalDataSource authLocalDataSource;
  late MovieCubit movieCubit;
  late PopularMoviesCubit popularMoviesCubit;
  late TopRatedMoviesCubit topRatedMoviesCubit;
  late GenresCubit genresCubit;
  late SearchMoviesCubit searchMoviesCubit;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    networkCubit = locator();
    signUpCubit = locator();
    signInCubit = locator();
    authCubit = locator();
    currentUserCubit = locator();
    authLocalDataSource = locator();
    movieCubit = locator();
    popularMoviesCubit = locator();
    topRatedMoviesCubit = locator();
    genresCubit = locator();
    searchMoviesCubit = locator();

    const token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjhiYjdlNjcxZGI5MDk4YzkyODIwNzI2YzFlMzNmMyIsIm5iZiI6MTcyNjY3MzU5OC4wNzk1MTEsInN1YiI6IjY1OTI5OTU5NjUxZmNmNWYxMzhlYjg3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GVZ2Pl55cJ2DL9K8gyIoZuoc96hRliyDJQApIqvJoYA";

    await authLocalDataSource.saveToken(token);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: networkCubit..check()),
        BlocProvider.value(value: authCubit..check()),
        BlocProvider.value(value: currentUserCubit),
        BlocProvider.value(value: searchMoviesCubit),
        BlocProvider.value(value: signUpCubit),
        BlocProvider.value(value: signInCubit),
        BlocProvider.value(value: movieCubit),
        BlocProvider.value(value: popularMoviesCubit),
        BlocProvider.value(value: topRatedMoviesCubit),
        BlocProvider.value(value: genresCubit),
      ],
      child: ScreenUtilInit(
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
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              highlightColor: Colors.transparent,
            ),
            home: BlocBuilder<NetworkCubit, NetworkState>(
              builder: (context, state) {
                if (state is NetworkNoConnected) {
                  return const Scaffold(
                    body: Center(
                      child: Text('NO CONNECTION', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  );
                }
                return BlocBuilder<AuthCubit, AuthState>(
                  builder: (BuildContext context, AuthState state) {
                    if (state is AuthNotSuccess) {
                      return const OnBoardingScreen();
                    } else if (state is AuthSuccess) {
                      return const MainScreen();
                    }

                    return const LoadingWidget();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
