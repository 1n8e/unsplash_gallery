import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/photo_bloc.dart';
import 'package:unsplash_gallery/ui/detailed_image_screen.dart';
import 'package:unsplash_gallery/ui/widget/photo_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.photo),
        title: Text('Unsplash gallery'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<PhotoBloc>().add(GetPhotoEvent());
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PhotoFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is PhotoSuccess) {
            return ListView.separated(
              itemCount: state.photo.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DetailedImageScreen(
                          photo: state.photo[index],
                        ),
                      ),
                    );
                  },
                  child: PhotoCard(
                    photo: state.photo[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            );
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
