import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
              style: GoogleFonts.lato(fontSize: 12, color: Colors.white),
            )),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.red))),
            child: Text(
              "View All",
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
