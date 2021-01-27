import 'package:flutter/material.dart';
import 'package:unsplash_gallery/model/photo_model.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        photo.thumbImg,
        width: 70,
        height: 75,
        fit: BoxFit.cover,
      ),
      title: Text(photo.name),
      subtitle: Text(photo.createdAt),
    );
  }
}
