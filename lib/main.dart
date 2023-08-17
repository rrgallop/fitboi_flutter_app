import 'package:fitboi_app/pages/details/details.dart';
import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'package:flutter/services.dart';

void main() {

WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBoi Fitness Tracker',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900
          ))
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
      initialRoute: '/details',
    );
  }
}

