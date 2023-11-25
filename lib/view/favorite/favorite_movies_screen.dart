import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:movie_moth/view/favorite/component/image_widget.dart';
import 'package:movie_moth/view/favorite/component/remove_button.dart';
import 'package:movie_moth/view_model/controller/home_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  State<FavoriteMoviesScreen> createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
          title: Text(
            'Favorites',
            style: GoogleFonts.raleway(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          shadowColor: const Color.fromARGB(255, 12, 9, 9),
          centerTitle: true,
        ),
        body: Obx(() {
          return Container(
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
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: homeController.favorites.length,
                itemBuilder: (context, index) {
                  Movie movie = homeController.favorites[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 850),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ImageWidget(
                                movie: movie,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                movie.title,
                                style: GoogleFonts.lato(
                                  color: const Color.fromARGB(255, 69, 17, 13),
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Divider(
                                color: const Color.fromARGB(255, 178, 10, 44),
                                height: height * 0.02,
                                indent: width * 0.3,
                                endIndent: width * 0.3,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Overview",
                                    style: GoogleFonts.lato(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ],
                              ),
                              Center(
                                child: SizedBox(
                                  child: Text(
                                    movie.overview,
                                    maxLines: 5,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Release Date:",
                                    style: GoogleFonts.lato(
                                        fontSize: 12, color: Colors.deepPurple),
                                  ),
                                  Text(
                                    "  ${movie.releaseDate}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              RemoveButton(
                                onPress: () {
                                  homeController.removeFavorite(movie);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }));
  }
}
