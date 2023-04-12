import 'package:flutter_authentication_bloc/models/auth_model.dart';
import 'package:flutter_authentication_bloc/services/auth_api_client.dart';

class AuthRepository {
  final String _apiKey= '/api/login';
  final AuthApiClient _authApiClient= AuthApiClient();
  Future<dynamic> login(String email,String password) async {
    final response = await _authApiClient.postLogin(_apiKey,{"email": email, "password":password});
    // print(response);
    return response;
  }
}
