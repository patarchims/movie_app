import 'package:flutter/material.dart';

import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/theme.dart';

class MovieCard extends StatelessWidget {
  final MovieModels movieModels;
  final Function onTap;
  const MovieCard({
    Key key,
    this.onTap,
    this.movieModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: 279,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            child: Container(
              width: 300,
              height: 207,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(movieModels.image),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        movieModels.name,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: textBlueFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      movieModels.country,
                      style: greyTextFont.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boxStar(),
                      boxStar(),
                      boxStar(),
                      boxStar(),
                      boxStar(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
