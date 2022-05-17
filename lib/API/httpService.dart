import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/profile.dart';

Future<Profile> fetchProfileData() async {
  final response =
      await http.get(Uri.parse('http://hp-api.herokuapp.com/api/characters'));
  print('profiledataResponse-----wqweqweqwe${response.body}');
  var userModel = null;
  if (response.statusCode == 200) {
    // print("response.body === ${response.body}");
    var image;
    try {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      print("safasfasfasfasf${jsonMap[15]}");
      var userModel = Profile.fromJson(jsonMap);
      // image = Profile.fromJson(jsonDecode(response.body));
      return userModel;
    } catch (error) {
      // <-- removing the on Exception clause
      print("throwing new error3123123 ${error}");
      return userModel;
    }

    // return image;
  } else {
    throw Exception('Failed to load profile Data --');
  }
}
