class ApiConstant{
  static const String apiKey = '0ad709f72c6b3a3839d9f90e556ebea7';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String nowPlayingMoviePath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetails(int movieID)=>"$baseUrl/movie/$movieID?api_key=$apiKey";
  static String movieRecommendationPath(int movieID)=>"$baseUrl/movie/$movieID/recommendations?api_key=$apiKey";

  ///Series

  static const String onAirSeriesPath = "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularSeriesPath = "$baseUrl/tv/popular?api_key=$apiKey";
  static const String topRatedSeriesPath = "$baseUrl/tv/top_rated?api_key=$apiKey";

  ///image
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String imagePath)=>"$baseImageUrl$imagePath";

}