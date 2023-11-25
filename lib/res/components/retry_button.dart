import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RetryButton extends StatelessWidget {
  final VoidCallback onPress;
  const RetryButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPress,
      child: Container(
        height: height * 0.05,
        width: width * 0.3,
        decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 3,
                  spreadRadius: 1,
                  color: Colors.grey.shade400)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Retry",
              style: GoogleFonts.lato(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            Image.asset(
              "assets/icon/retry.png",
              height: height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
