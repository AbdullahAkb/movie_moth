import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/res/components/retry_button.dart';
import 'package:movie_moth/view_model/services/splash_services.dart';

class NetworkErrorView extends StatelessWidget {
  const NetworkErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.wifi_slash,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: SizedBox(
              width: width * 0.7,
              child: Text(
                "Internet not Working!\nPlease make sure you're connected to proper network.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          RetryButton(
            onPress: () {
              SplashServices.splashToHome(context);
            },
          )
        ],
      ),
    );
  }
}
