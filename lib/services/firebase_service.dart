import 'package:cloud_firestore/cloud_firestore.dart';


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
Future<void> addMovie(String director, String genre, String img,
    String synopsis, String title, String year) async {
  await db.collection("movies").add({
    "director": director,
    "genre": genre,
    "img": img,
    "synopsis": synopsis,
    "title": title,
    "year": year,
  });
}

Future<void> updateMovie(String uid, String newDirector, String newGenre,
    String newImg, String newSynopsis, String newTitle, String newYear) async {
  await db.collection("movies").doc(uid).set({
    "director": newDirector,
    "genre": newGenre,
    "img": newImg,
    "synopsis": newSynopsis,
    "title": newTitle,
    "year": newYear
  });
}

Future<void> deleteMovie(String uid) async {
  await db.collection("movies").doc(uid).delete();
}
