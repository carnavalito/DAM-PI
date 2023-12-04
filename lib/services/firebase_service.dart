import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getMovies() async {
  List movies = [];
  QuerySnapshot querySnapshot = await db.collection('movies').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final movie = {
      "uid": doc.id,
      "director": data["director"],
      "genre": data["genre"],
      "img": data["img"],
      "synopsis": data["synopsis"],
      "title": data["title"],
      "year": data["year"],
    };
    movies.add(movie);
  }

  return movies;
}

//String director,String genre,String img,String synopsis,String year,
Future<void> addMovie(String title) async {
  await db.collection("movies").add({
    // "director": director,
    // "genre": genre,
    // "img": img,
    // "synopsis": synopsis,
    "title": title,
    // "year": year,
  });
}

Future<void> updateMovie(
    String uid, String newTitle, String newSynopsis) async {
  await db.collection("movies").doc(uid).set({
    "title": newTitle,
    "synopsis": newSynopsis,
  });
}

Future<void> deleteMovie(String uid) async {
  await db.collection("movies").doc(uid).delete();
}
