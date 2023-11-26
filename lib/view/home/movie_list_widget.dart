import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:movie_moth/repository/home_repository/movie_service.dart';
import 'package:movie_moth/res/routes/routes_name.dart';
import 'package:movie_moth/view/home/component/appbar_title_widget.dart';
import 'package:movie_moth/view/home/component/custom_badge_widget.dart';
import 'package:movie_moth/view/home/component/description_view.dart';
import 'package:movie_moth/view/home/component/favorite_button.dart';
import 'package:movie_moth/view/home/component/header_widget.dart';
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
        title: const AppbarTitleWidget(),
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        centerTitle: true,
        actions: [
          const CustomBadgeWidget(),
          SizedBox(
            width: width * 0.02,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
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
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        scale: 5,
                        opacity: 0.4,
                        image: AssetImage(
                          'assets/icon/moth.png',
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const HeaderWidget(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Movie movie =
                                    Movie.fromJson(snapshot.data![index]);
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
                                                children: [
                                                  DescriptionView(movie: movie),
                                                  SizedBox(
                                                    height: height * 0.02,
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
