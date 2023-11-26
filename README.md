# Movie Moth

It's Name of this flutter project.

As per requirement:

- I initialize a new project and added required below dependencies:
  - google_fonts: ^6.1.0
  - flutter_spinkit: ^5.2.0
  - http: ^1.1.0
  - cached_network_image: ^3.3.0
  - shared_preferences: ^2.2.2
  - get: ^4.6.6
  - flutter_launcher_icons: ^0.13.1
  - flutter_staggered_animations: ^1.1.1
  - internet_connection_checker: ^1.0.0+1
  
- After that i create model class name "Movie" with required properties.
- I use http package for making api request to fetch data in class name MovieService.
- Then, I create class name "MovieListWidget", which used for create ui under FutureBuilder which calls future function and displays a loader while fetching data.
- I used Shared_Preferences to store saved movies which are added to Favorite List.
- Then, I create a class name "FavoriteMoviesScreen" to show all the favorite Movies.
- I also handle errors like: network connectivity error, Null error.
- For this project i use MVVM architecture.
