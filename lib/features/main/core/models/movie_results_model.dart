import '../entities/movie_results_entity.dart';
import 'movie_model.dart';

class MovieResultsModel extends MovieResultsEntity {
  const MovieResultsModel({required super.data});

  factory MovieResultsModel.fromJson(Map<String, dynamic> json) {
    return MovieResultsModel(
        data: List.from(json['results'])
            .map((e) => MovieModel.fromJson(e))
            .toList());
  }
}
