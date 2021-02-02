import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_gallery/bloc/photo_bloc.dart';
import 'package:unsplash_gallery/core/api_url.dart';
import 'package:unsplash_gallery/data/data.dart';

final getIt = GetIt.instance;

void setupInjections() {
  getIt.registerFactory<Dio>(
    () => Dio(
      BaseOptions(baseUrl: API_URL),
    ),
  );

  getIt.registerFactory<PhotoDataSource>(() => PhotoDataSource(getIt()));

  getIt.registerFactory<PhotoBloc>(() => PhotoBloc(getIt()));
}
