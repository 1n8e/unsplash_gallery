part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccess extends PhotoState {
  final List<Photo> photo;

  PhotoSuccess(this.photo);
}

class PhotoFailure extends PhotoState {
  final String error;

  PhotoFailure(this.error);
}