import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/disney_card.dart';
import 'package:movie_app/movie_card.dart';
import 'package:movie_app/movie_detail_page.dart';
import 'package:movie_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPages extends StatefulWidget {
  @override
  _DashboardPagesState createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  @override
  void initState() {
    super.initState();

    context.read<MovieCubit>().getMovies(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xFFFDFDFE),
                  Color(0xFFF3F4F8),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(defaultMargin, 33, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Moviez",
                            style: textBlueFont.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          Text(
                            "Watch much esier",
                            style: greyTextFont,
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 45,
                        width: 55,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Icon(Icons.search_rounded,
                            color: blueColor, size: 22),
                      )
                    ],
                  ),
                ),

                // List Of movie
                Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin, top: defaultMargin),
                    height: 300,
                    width: double.infinity,
                    child: BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) => (state is MovieLoaded)
                            ? Padding(
                                padding: EdgeInsets.all(10),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: state.movieModel
                                      .sublist(0, 10)
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                                left: (e ==
                                                        state.movieModel.first)
                                                    ? 24
                                                    : 0),
                                            child: MovieCard(
                                              onTap: () {
                                                Get.to(MovieDetailPage(
                                                  movieModel: e,
                                                ));
                                              },
                                              movieModels: e,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                            : Center(
                                child: Text("No Data"),
                              ))),

                // Text Form Disney

                Container(
                  margin: EdgeInsets.only(top: 30, left: defaultMargin),
                  child: Text(
                    "From Disney",
                    style: textBlueFont.copyWith(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(left: defaultMargin),
                    height: 500,
                    child: BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) => (state is MovieLoaded)
                            ? ListView(
                                children: state.movieModel
                                    .sublist(11, 20)
                                    .map((e) => DisneyCard(
                                          movieModels: e,
                                        ))
                                    .toList(),
                              )
                            : Center(
                                child: Text("No data"),
                              )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
