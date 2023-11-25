import 'package:get/get.dart';
import 'package:movie_moth/res/components/network_error_view.dart';
import 'package:movie_moth/res/routes/routes_name.dart';
import 'package:movie_moth/view/favorite/favorite_movies_screen.dart';

import 'package:movie_moth/view/home/movie_list_widget.dart';
import 'package:movie_moth/view/spalsh_screen/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
        GetPage(
            name: RoutesName.homeView,
            page: () => const MovieListWidget(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
        GetPage(
            name: RoutesName.favoriteView,
            page: () => const FavoriteMoviesScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
        GetPage(
            name: RoutesName.networkErrorView,
            page: () => const NetworkErrorView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
      ];
}
