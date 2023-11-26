import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:movie_moth/repository/home_repository/movie_service.dart';
import 'package:movie_moth/res/routes/routes_name.dart';
import 'package:movie_moth/view/home/component/favorite_button.dart';
import 'package:movie_moth/view/home/component/image_widget.dart';
import 'package:movie_moth/view_model/controller/home_controller.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.1,
        title: Column(
          children: [
            Image.asset(
              "assets/icon/moth.png",
              height: height * 0.04,
            ),
            Text(
              'Movie Moth',
              style: GoogleFonts.raleway(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(RoutesName.favoriteView);
            },
            child: Container(
              height: height * 0.08,
              width: width * 0.2,
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.red,
                  ),
                  const Divider(
                    color: Colors.red,
                    indent: 23,
                    endIndent: 23,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              // Color.fromARGB(255, 178, 10, 44),
              Color.fromARGB(255, 255, 17, 0),
              Color.fromARGB(255, 255, 251, 213),
            ],
          ),
        ),
        child: FutureBuilder(
          future: MovieService().movieList(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitPianoWave(
                    color: Colors.red,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            height: height * 0.037,
                            width: width * 0.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              "Popular",
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Expanded(
                        child: AnimationLimiter(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Movie movie =
                                  Movie.fromJson(snapshot.data![index]);
                              // bool isFavorite =
                              //     homeController.favorites.contains(movie);

                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 850),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    RoutesName.detailView,
                                                    arguments: movie);
                                              },
                                              child: ImageWidget(
                                                movie: movie,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.4,
                                                  child: Text(
                                                    movie.title,
                                                    style: GoogleFonts.lato(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 69, 17, 13),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                Center(
                                                  child: SizedBox(
                                                    width: width * 0.4,
                                                    child: Text(
                                                      movie.overview,
                                                      maxLines: 5,
                                                      style: GoogleFonts.lato(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.015,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Release Date:",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    Text(
                                                      "  ${movie.releaseDate}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                FavoriteButton(
                                                  onPress: () {
                                                    homeController
                                                        .addFavorite(movie);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: const Color.fromARGB(
                                              255, 178, 10, 44),
                                          height: height * 0.04,
                                          indent: width * 0.3,
                                          endIndent: width * 0.3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const Center(
                child: SpinKitPianoWave(
                  color: Colors.red,
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
