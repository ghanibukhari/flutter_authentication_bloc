import 'dart:convert';

import 'package:flutter_authentication_bloc/constants/constant.dart';
import 'package:http/http.dart' as http;

class AuthApiClient {
  Future<dynamic> postLogin(String url, dynamic body) async {
    final response = await http.post(Uri.parse(apiUrl + url), body: body);
    var responseJson = getApiResponse(response);
    return responseJson;
  }

  getApiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson["token"];
      case 400:
        var responseError = jsonDecode(response.body.toString());
        return responseError["error"];
      default:
        return Exception('Error:${response.statusCode.toString()}');
    }
  }
}
