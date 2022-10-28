import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gorilla_hash/config/routes/index.dart';
import 'package:gorilla_hash/config/style/theme/index.dart';
import 'package:gorilla_hash/utilities/providers/index.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        routes: getRoutes(context),
        theme: getThemeData(),
        home: Container(),
      ),
    );
  }
}
