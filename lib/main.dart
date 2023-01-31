import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/general/general_bloc.dart';
import 'package:gorilla_hash/config/routes/index.dart';
import 'package:gorilla_hash/config/style/theme/index.dart';
import 'package:gorilla_hash/pages/p2p/index.dart';

void main() async {
/*   await dotenv.load(fileName: ".env"); */
  runApp(const MyApp());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneralBloc>(
          create: (context) => GeneralBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoutes(context),
      theme: getThemeData(),
      home: Container(child: p2pScreen()),
    );
  }
}
