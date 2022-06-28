import 'package:algoriza_first_task/pages/on%20boarding/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white,iconTheme:IconThemeData(color: Colors.redAccent)),
      ),
      home: OnBoardingView(),
    );
  }
}
