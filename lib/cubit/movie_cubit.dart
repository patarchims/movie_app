import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/services/services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  final List<MovieModels> movies = [];

  // Get Data movie from json
  Future<void> getMovies(int page) async {
    ServiceResult<List<MovieModels>> result =
        await MovieServices.getMovie(page);

    if (result.data != null) {
      emit(MovieLoaded(movieModel: result.data));
    } else {
      emit(MovieLoadedFailed(result.message));
    }
  }
}
