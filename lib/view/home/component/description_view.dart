import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/models/movie.dart';

class DescriptionView extends StatelessWidget {
  final Movie movie;
  const DescriptionView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.4,
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Center(
            child: SizedBox(
              width: width * 0.4,
              child: Text(
                movie.overview,
                maxLines: 5,
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
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
                style: GoogleFonts.lato(fontSize: 12, color: Colors.red),
              ),
              Text(
                "  ${movie.releaseDate}",
                style: GoogleFonts.lato(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
