import 'package:dio/dio.dart';
import 'package:movies_app/core/data/error/exceptions.dart';
import 'package:movies_app/core/data/network/api_constants.dart';
import 'package:movies_app/core/data/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<List<MovieModel>>> getMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait(
      [
        getPopularMovies(),
      ],
      eagerError: true,
    );
    return response;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    int movieId,
  ) async {
    final response = await Dio().get(ApiConstants.getMovieDetailsPath(movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
