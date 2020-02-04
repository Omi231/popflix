import 'package:http/http.dart';
import 'package:popflix/CORE/Networking/ApiProvider.dart';

class Repository {
  static ApiProvider apiProvider = ApiProvider();

  static Future<Response> fetchAllMovies(int page) async {
    return await apiProvider.getAllMovies(page);
  }

  static Future<Response> fetchAllShows(int page) async {
    return await apiProvider.getAllShows(page);
  }

  static Future<Response> fetchAllAnimes(int page) async {
    return await apiProvider.getAllAnimes(page);
  }

  static Future<Response> fetchShowDetails(String imdbId) async {
    return await apiProvider.getShowDetails(imdbId);
  }

  static Future<Response> fetchAnimeDetails(String id) async {
    return await apiProvider.getAnimeDetails(id);
  }


}
