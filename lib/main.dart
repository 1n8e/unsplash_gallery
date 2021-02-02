import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/photo_bloc.dart';
import 'package:unsplash_gallery/core/setup_injections.dart';
import 'package:unsplash_gallery/data/data.dart';
import 'package:unsplash_gallery/ui/home_screen.dart';

void main() {
  setupInjections();
  runAppMyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotoBloc>(
          create: (_) => getIt<PhotoBloc>()..add(GetPhotoEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeScreen(),
      ),
    );
  }
}
