import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_moth/res/routes/routes_name.dart';
import 'package:movie_moth/view_model/controller/home_controller.dart';

class CustomBadgeWidget extends StatefulWidget {
  const CustomBadgeWidget({super.key});

  @override
  State<CustomBadgeWidget> createState() => _CustomBadgeWidgetState();
}

class _CustomBadgeWidgetState extends State<CustomBadgeWidget> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return InkWell(
      highlightColor: null,
      onTap: () {
        Get.toNamed(RoutesName.favoriteView);
      },
      child: Obx(
        () => homeController.favorites.isEmpty
            ? const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              )
            : badges.Badge(
                onTap: () {
                  Get.toNamed(RoutesName.favoriteView);
                },
                badgeContent: Text(
                  homeController.favorites.length.toString(),
                  style: GoogleFonts.lato(),
                ),
                showBadge: true,
                ignorePointer: true,
                badgeStyle: const badges.BadgeStyle(
                    shape: badges.BadgeShape.circle, badgeColor: Colors.white),
                badgeAnimation: const badges.BadgeAnimation.slide(),
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
              ),
      ),
    );
  }
}
