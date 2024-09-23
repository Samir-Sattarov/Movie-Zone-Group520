import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/entities/no_params.dart';
import '../../../core/entities/genre_results_entity.dart';
import '../../../core/usecases/genres_usecases.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUsecase getGenresUsecase;
  GenresCubit(this.getGenresUsecase) : super(GenresInitial());

  load() async {
    emit(GenresLoading());

    final response = await getGenresUsecase.call(NoParams());

    response.fold(
          (l) => emit(GenresError(l.errorMessage)),
          (r) => emit(GenresLoaded(r)),
    );
  }
}
