import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedButton extends StatelessWidget {
  final VoidCallback onPress;

  const SelectedButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width * 0.45,
        height: height * 0.05,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Favorite",
              style: GoogleFonts.lato(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
