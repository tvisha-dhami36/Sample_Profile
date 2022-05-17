import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/profile.dart';

Future<Profile> fetchProfileData() async {
  final response =
      await http.get(Uri.parse('http://hp-api.herokuapp.com/api/characters'));
  print('profiledataResponse-----wqweqweqwe${response.body}');
  if (response.statusCode == 200) {
    var image;
    try {
      image = Profile.fromJson(jsonDecode(response.body));
    } catch (error) {
      print("throwing new error3123123 ${error}");
    }
    return image;
  } else {
    throw Exception('Failed to load profile Data --');
  }
}
