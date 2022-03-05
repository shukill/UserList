import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/app_constants.dart';
import '../models/user_model.dart';

class HomeApis {
  late Response response;
  var dio = Dio();

  Future<List<UserList>> getAllUserList() async {
    try {
      List<UserList> res = [];
      response = await dio.get('${AppConstans.baseUrl}users');
      if (response.statusCode == 200) {
        res = userListFromJson(jsonEncode(response.data));
        return res;
      } else {
        res = _response(response);
      }
      return res;
    } on SocketException {
      throw 'No Internet connection';
    }
  }
}

dynamic _response(Response response) {
  switch (response.statusCode) {
    case 400:
      throw response.data.toString();
    case 401:
    case 403:
      throw response.data.toString();
    case 500:
    default:
      throw 'Error occured while Communication with Server with StatusCode: ${response.statusCode}';
  }
}
