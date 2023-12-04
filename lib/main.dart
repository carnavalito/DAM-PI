import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pi/pages/edit_movie_page.dart';
import 'package:pi/pages/login_page.dart';
import 'package:pi/pages/sign_up_page.dart';
import 'package:pi/pages/splash_screen.dart';
import 'firebase_options.dart';

//Pages
import 'package:pi/pages/add_movie_page.dart';
import 'package:pi/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) =>  Home(),
        '/add': (context) =>  AddMoviePage(),
        '/edit': (context) =>  EditMoviePage(),

      },
    );
  }
}
