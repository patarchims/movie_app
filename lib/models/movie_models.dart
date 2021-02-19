import 'package:equatable/equatable.dart';

class MovieModels extends Equatable {
  final String name;
  final int id;
  final String permalink;
  final String startDate;
  final String endDate;
  final String country;
  final String network;
  final String image;

  MovieModels({
    this.name,
    this.id,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.image,
  });

  factory MovieModels.fromJson(Map<String, dynamic> map) => MovieModels(
        name: map['name'],
        id: map['id'] as int,
        permalink: map['permalink'],
        startDate: map['start_date'],
        endDate: map['end_date'],
        country: map['country'],
        network: map['network'],
        image: map['image_thumbnail_path'],
      );

  @override
  List<Object> get props =>
      [name, id, permalink, startDate, endDate, country, network, image];
}
