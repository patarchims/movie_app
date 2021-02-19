import 'package:movie_app/models/movie_models.dart';

class MovieDetailModel extends MovieModels {
  final List genres;
  final String bigImage;
  final String rating;
  final String description;

  MovieDetailModel(
    MovieModels movieModels, {
    this.genres,
    this.bigImage,
    this.rating,
    this.description,
  }) : super(
            country: movieModels.country,
            endDate: movieModels.endDate,
            id: movieModels.id,
            image: movieModels.image,
            name: movieModels.name,
            network: movieModels.network,
            permalink: movieModels.permalink,
            startDate: movieModels.startDate);

  @override
  List<Object> get props => [genres, bigImage, rating, description];
}
