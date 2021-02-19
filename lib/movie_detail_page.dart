import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/services/services.dart';
import 'package:movie_app/theme.dart';
import 'package:flutter_html/flutter_html.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModels movieModel;

  const MovieDetailPage({
    Key key,
    this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailModel movieDetailModel;

    return Scaffold(
      backgroundColor: Color(0xFFF3F4F8),
      body: FutureBuilder(
        future: MovieServices.getMovieDetail(movieModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            movieDetailModel = snapshot.data;
            print(movieDetailModel);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Container(
                    width: MediaQuery.of(context).size.width - 2 * 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movieModel.name,
                          style: textBlueFont.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )
                      ],
                    ),
                  ),
                  backgroundColor: blueColor,
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movieDetailModel.bigImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 12),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      movieModel.name,
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: textBlueFont.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    color: greyColor,
                                    width: 1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    movieDetailModel.rating,
                                    style: greyTextFont.copyWith(fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  boxStar(),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 14),
                                height: 25,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFCBD7D6),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            movieDetailModel.genres[index],
                                            style: textBlueFont,
                                          )),
                                        ),
                                      );
                                    },
                                    itemCount: movieDetailModel.genres.length),
                              ),
                            ],
                          )),
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Html(
                            data: movieDetailModel.description,
                          )),
                          SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Something Error"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
