import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:unsplash_gallery/model/photo_model.dart';


class PhotoDataSource {
  static const String url = "https://api.unsplash.com/photos/?client_id=P4hMKebAVRqkO6CDyyFDvVeYlpiLbs3CObSkiyM4jlA";

  Future<List<Photo>> getData() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((e) => Photo.fromJson(e))
        .toList();
  }
}