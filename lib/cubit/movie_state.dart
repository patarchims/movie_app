part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieModels> movieModel;

  MovieLoaded({
    this.movieModel,
  });

  @override
  List<Object> get props => [movieModel];
}

// ignore: must_be_immutable
class MovieLoadedFailed extends MovieState {
  String message;

  MovieLoadedFailed(
    this.message,
  );

  @override
  List<Object> get props => [message];
}
