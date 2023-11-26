import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarTitleWidget extends StatelessWidget {
  const AppbarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
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
    );
  }
}
