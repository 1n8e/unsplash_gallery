import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unsplash_gallery/data/data.dart';
import 'package:unsplash_gallery/model/photo_model.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc(this.photoDataSource) : super(PhotoInitial());
  final PhotoDataSource photoDataSource;

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is GetPhotoEvent) {
      yield PhotoLoading();
      try {
        final List<Photo> photo = await photoDataSource.getData();
        yield PhotoSuccess(photo);
    } catch (e) {
        yield PhotoFailure(e.toString());
      }
    }
  }
}
