import 'package:flutter/material.dart';
import 'package:unsplash_gallery/model/photo_model.dart';

class DetailedImageScreen extends StatelessWidget {
  final Photo photo;

  const DetailedImageScreen({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(photo.fullImg),
    );
  }
}
