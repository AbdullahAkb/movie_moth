import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:movie_moth/view/favorite/component/image_widget.dart';
import 'package:movie_moth/view/home/component/favorite_button.dart';
import 'package:movie_moth/view_model/controller/home_controller.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Movie movie = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
        centerTitle: true,
        title: Text(
          movie.title,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ImageWidget(
                      movie: movie,
                    ),
                    SizedBox(
                      height: height * 0.01,
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
                          style:
                              GoogleFonts.lato(fontSize: 12, color: Colors.red),
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
                              fontSize: 19, color: Colors.black),
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
                      height: height * 0.15,
                    ),
                    FavoriteButton(
                      onPress: () {
                        HomeController().addFavorite(movie);
                      },
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
