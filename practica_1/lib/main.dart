import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Fake_spotify/bloc/shazam_api_bloc.dart';
import 'package:Fake_spotify/home_page.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShazamApiBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FindTrackApp',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.dark,
        ),
        home: HomePage());
  }
}
