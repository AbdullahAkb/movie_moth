import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_moth/data/app_exception.dart';
import 'package:movie_moth/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on RequestTimeout {
      throw RequestTimeout();
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrl();

      default:
        throw FetchException(" ${response.statusCode}");
    }
  }
}
