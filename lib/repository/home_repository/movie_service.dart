import 'package:movie_moth/data/network/network_api_services.dart';
import 'package:movie_moth/res/app_url/app_url.dart';

class MovieService {
  final _apiServices = NetworkApiServices();

  Future<List<dynamic>> movieList() async {
    dynamic response = await _apiServices.getApi(AppUrls.mainUrl);
    final List<dynamic> results = response['results'];
    return results;
  }
}
