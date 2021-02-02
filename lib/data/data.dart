import 'package:dio/dio.dart';
import 'dart:async';
import 'package:unsplash_gallery/model/photo_model.dart';

class PhotoDataSource {
  final Dio dio;

  PhotoDataSource(this.dio);

  Future<List<Photo>> getData() async {
    Response response = await dio.get('');

    return (response.data as List).map((e) => Photo.fromJson(e)).toList();
  }
}
