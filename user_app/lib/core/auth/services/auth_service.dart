import 'dart:convert';

import 'package:user_app/base/base_service.dart';
import 'package:user_app/network/api_constants.dart';
import 'package:user_app/network/api_response.dart';
import 'package:user_app/network/network_manager.dart';
import 'package:user_app/network/network_request.dart';

class AuthService extends BaseService{
   Future<ApiResponse> registerUserService(
      {required String username,
      required String password,
      required String email}) async {
    var data = {
      "username": username,
      "password2": password,
      "password": password,
      "email": email
    };
    NetworkRequest request = NetworkRequest(
      "$baseUrl$registerUrl",
      RequestMethod.post,
      data: jsonEncode(data),
      headers: getHeaders(),
    );

    final result = await NetworkManager.instance.perform(request);

    if (result.json != null) {
      var userMap = result.json;
      result.data = userMap;
    }
    return result;
  }

  Future<ApiResponse> loginUserService({
    required String username,
    required String password,
  }) async {
    var data = {
      "username": username,
      "password": password,
    };
    NetworkRequest request = NetworkRequest(
      "$baseUrl$loginUrl",
      RequestMethod.post,
      data: jsonEncode(data),
      headers: getHeaders(),
    );

    final result = await NetworkManager.instance.perform(request);

    if (result.json != null) {
      var userMap = result.json;
      result.data = userMap;
    }
    return result;
  }
}