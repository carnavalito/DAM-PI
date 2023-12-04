import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pi/pages/edit_movie_page.dart';
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
        '/': (context) => const Home(),
        '/add': (context) => const AddMoviePage(),
        '/edit': (context) => const EditMoviePage(),

      },
    );
  }
}
