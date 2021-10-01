import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:social_media_app/repository/api_config.dart';

class AuthRepository {
  static profileDetails() async {
    return await http.get(Uri.parse("${ApiConfig.baseUrl}/profile-details"));
  }

  static Future loginApi({String email, String password}) async {
    return await post(Uri.parse("${ApiConfig.baseUrl}/login"));
  }

  static Future registerApi(
      {String name, String email, String password}) async {
    print(name);
    print(email);
    print(password);
    return await post(Uri.parse("${ApiConfig.baseUrl}/register"), body: {
      'name': "$name",
      'email': "$email",
      'password': "$password",
      'device_token': "fffawf",
      'device_type': "${Platform.isAndroid ? "android" : "ios"}",
      'device_id': "device_id",
    });
  }

  // static updateData({String name, String email, String password}) async {
  //   return await http.put(Uri.parse("${ApiConfig.baseUrl}/profile-update/$id"));
  // }
}
