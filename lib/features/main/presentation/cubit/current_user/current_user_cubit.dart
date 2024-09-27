import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/app_core_library.dart';
import '../../../../auth/core/entities/user_entity.dart';
import '../../../core/entities/movie_entity.dart';
import '../../../core/usecases/user_usecases.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final EditCurrentUserUsecase editCurrentUserUsecase;
  CurrentUserCubit(this.getCurrentUserUsecase, this.editCurrentUserUsecase)
      : super(CurrentUserInitial());

  UserEntity _user = UserEntity.empty();

  UserEntity get user => _user;

  load() async {
    emit(CurrentUserLoading());
    final response = await getCurrentUserUsecase.call(NoParams());

    response.fold(
      (l) => emit(CurrentUserError(l.errorMessage)),
      (r) {
        _user = r;
        emit(CurrentUserLoaded(_user));
      },
    );
  }

  removeFavoriteMovie(MovieEntity movie) async {
    _user.deleteFavoriteMovie(movie);

    final response =
        await editCurrentUserUsecase.call(EditCurrentUserUsecaseParams(_user));

    response.fold(
      (l) => emit(CurrentUserError(l.errorMessage)),
      (r) => emit(CurrentUserSaved(_user)),
    );
  }

  saveFavoriteMovie(MovieEntity movie) async {
    _user.setFavoriteMovie(movie);

    // print(_user.favoriteMovies);
    emit(CurrentUserLoading());

    final response =
        await editCurrentUserUsecase.call(EditCurrentUserUsecaseParams(_user));

    response.fold(
      (l) => emit(CurrentUserError(l.errorMessage)),
      (r) => emit(CurrentUserSaved(_user)),
    );
  }

  save(UserEntity user) async {
    emit(CurrentUserLoading());

    final response =
        await editCurrentUserUsecase.call(EditCurrentUserUsecaseParams(user));

    response.fold(
      (l) => emit(CurrentUserError(l.errorMessage)),
      (r) {
        _user = user;
        emit(CurrentUserLoaded(_user));
      },
    );
  }
}
