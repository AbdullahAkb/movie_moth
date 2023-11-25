import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:movie_moth/res/app_url/app_url.dart';

class ImageWidget extends StatelessWidget {
  final Movie movie;
  const ImageWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.4,
      width: width * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 3),
              blurRadius: 2,
              spreadRadius: 2),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: AppUrls.imageBaseUrl + movie.posterUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) {
            return Container(
              height: height * 0.27,
              width: width * 0.45,
              color: Colors.white,
              child: const SpinKitPianoWave(
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
