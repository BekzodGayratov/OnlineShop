import 'package:app/routes/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MyRouter _forRouter = MyRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Market",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _forRouter.onGenerateRoute,
    );
  }
}
