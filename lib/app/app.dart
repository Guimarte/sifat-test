import 'package:flutter/material.dart';

import 'features/home/home.dart';
import 'features/landing/pages/landing_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: LandingPage()),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {'/home': (context) => Home()},
    );
  }
}
