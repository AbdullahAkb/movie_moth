import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_moth/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<dynamic> favorites = <dynamic>[].obs;

  final RxBool isFavorite = false.obs;

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('favorites');

    if (jsonString != null) {
      List<Movie> decodedMovies = (jsonDecode(jsonString) as List<dynamic>)
          .map((item) => Movie.fromJson(item))
          .toList();
      favorites.assignAll(decodedMovies);
    }
    update();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(favorites.map((movie) => movie.toJson()).toList());
    await prefs.setString('favorites', jsonString);
  }

  void addFavorite(Movie movie) {
    if (favorites.contains(movie)) {
      Get.snackbar('Already Favorite', movie.title,
          colorText: Colors.white,
          animationDuration: Duration(milliseconds: 500),
          margin: EdgeInsets.symmetric(horizontal: 40));
    } else {
      favorites.add(movie);
      Get.snackbar(
        'Added to Favorites',
        movie.title,
        colorText: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(horizontal: 40),
      );
      _saveFavorites();
      update();
      isFavorite.value = true;
    }

    // Save favorites to shared_preferences when a new movie is added
  }

  void removeFavorite(Movie movie) {
    favorites.remove(movie);
    _saveFavorites();
    isFavorite.value = false;
    Get.snackbar('Removed from Favorites', movie.title,
        colorText: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(horizontal: 40));
    update();
  }

  bool isMovieFavorite(Movie movie) {
    if (favorites.contains(movie)) {
      isFavorite.value = true;
    }
    return isFavorite.value;
  }
}
