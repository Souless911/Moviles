import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_tine/home_page.dart';
import 'package:tip_tine/providers/tip_time_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: ChangeNotifierProvider(
          create: (context) => TipTimeProvider(),
          child: HomePage(),
        ));
  }
}
