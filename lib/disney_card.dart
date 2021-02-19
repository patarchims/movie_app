import 'package:flutter/material.dart';

import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/theme.dart';

class DisneyCard extends StatelessWidget {
  final MovieModels movieModels;
  const DisneyCard({
    Key key,
    this.movieModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 127,
      child: Row(
        children: [
          Container(
            height: 127,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(movieModels.image), fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  movieModels.name,
                  style: textBlueFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  movieModels.country,
                  style: greyTextFont.copyWith(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  children: [
                    boxStar(),
                    boxStar(),
                    boxStar(),
                    boxStar(),
                  ],
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
