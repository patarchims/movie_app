part of 'services.dart';

class MovieServices implements Services {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  static Future<ServiceResult<List<MovieModels>>> getMovie(int page,
      {http.Client client}) async {
    client ??= http.Client();

    try {
      String url = "https://www.episodate.com/api/most-popular?page=$page";

      var response =
          await client.get(url, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List<MovieModels> movieModels = (data['tv_shows'] as Iterable)
            .map((e) => MovieModels.fromJson(e))
            .toList();

        return ServiceResult(data: movieModels);
      } else {
        return ServiceResult(
            status: false, message: "Status Code ${response.statusCode}");
      }
    } catch (e) {
      return ServiceResult(status: false, message: e.toString());
    }
  }

  // Get Movie Detail
  static Future<MovieDetailModel> getMovieDetail(MovieModels movieModels,
      {http.Client client}) async {
    client ??= http.Client();

    try {
      String url =
          "https://www.episodate.com/api/show-details?q=${movieModels.id}";

      var response =
          await client.get(url, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        final result = data['tvShow'];
        print(result);

        return MovieDetailModel(MovieModels.fromJson(result),
            description: result['description'],
            bigImage: result['image_path'],
            genres: result['genres'],
            rating: result['rating']);
      }
    } catch (e) {
      print(e);
    }
  }
}
