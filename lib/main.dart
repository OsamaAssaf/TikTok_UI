import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktokui/view_models/home_view_model.dart';
import 'views/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.black
      ),
      home: const HomeView(),
    );
  }
}
