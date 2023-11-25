import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';
import 'package:movie_moth/res/routes/routes_name.dart';

class SplashServices {
  static void splashToHome(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, RoutesName.homeView);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () {
          Get.toNamed(RoutesName.networkErrorView);
        },
      );
    }
  }
}
