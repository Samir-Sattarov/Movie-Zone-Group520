import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app_core/utils/test_data.dart';
import '../../../../app_core/widgets/error_flush_bar_widget.dart';
import '../../../../app_core/widgets/loading_widget.dart';
import '../../../../app_core/widgets/success_flush_bar_widget.dart';
import '../../core/entities/movie_entity.dart';
import '../cubit/current_user/current_user_cubit.dart';
import '../widgets/movie_horizontal_card_widget.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  List<MovieEntity> movieList = [];
  @override
  void initState() {
    BlocProvider.of<CurrentUserCubit>(context).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CurrentUserCubit, CurrentUserState>(
        listener: (context, state) {
          if (state is CurrentUserError) {
            ErrorFlushBar(state.message).show(context);
          }

          if (state is CurrentUserSaved) {
            SuccessFlushBar("movieDeletedFromFavorite".tr()).show(context);

            if (mounted) {
              final data = state.user.favoriteMovies.values.toList();

              Future.delayed(
                Duration.zero,
                () {
                  setState(() {
                    movieList = data;
                  });
                },
              );
            }
          }

          if (state is CurrentUserLoaded) {
            if (mounted) {
              final data = state.user.favoriteMovies.values.toList();

              Future.delayed(
                Duration.zero,
                () {
                  setState(() {
                    movieList = data;
                  });
                },
              );
            }
          }
        },
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "myLibrary".tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              BlocBuilder<CurrentUserCubit, CurrentUserState>(
                builder: (context, state) {
                  if (state is CurrentUserLoading) {
                    return const LoadingWidget();
                  }

                  return Expanded(
                    child:   movieList.isEmpty ?   Center(
                      child: Text('Empty...', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp, color: Colors.white,),
                    )) :ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: movieList.length,
                      itemBuilder: (context, index) {
                        final movie = movieList[index];
                        return Slidable(
                          key: UniqueKey(),
                          direction: Axis.horizontal,
                          endActionPane: ActionPane(
                            motion: const BehindMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async =>
                                    BlocProvider.of<CurrentUserCubit>(context)
                                        .removeFavoriteMovie(movie),
                                padding: EdgeInsets.zero,
                                spacing: 0,
                                autoClose: true,
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: MovieHorizontalCardWidget(
                            entity: movie,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
