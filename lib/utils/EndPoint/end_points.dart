class EndPoints{
  static const String host="api.themoviedb.org";
  static const String newReleasesMovies="/3/movie/upcoming";
  static const String recommendedMovie="/3/movie/top_rated";
  static const String popularMovies="/3/movie/popular";
  static const String movieDetails="/3/movie";
  static const String movieGenres="/3/genre/movie/list";
  static const String movieWatchList="/3/account";
  static const String searchMovie="/3/search/movie";
  static const String discoverMovie="/3/discover/movie";
  static const Map<String, String> headers = {
    "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
    "accept": "application/json"
  };

}