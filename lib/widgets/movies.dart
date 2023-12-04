//
// import 'package:flutter/material.dart';
// import 'package:pi/services/firebase_service.dart';
//
// import '../models/movie_model.dart';
// import 'movie-card.dart';
//
// class MoviesPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MoviesPageState();
//   }
// }
//
// class _MoviesPageState extends State<MoviesPage> {
//   final List<Movie> movies = getMovies();
//
//   Widget _buildMoviesList() {
//     return Container(
//       child: movies.length > 0
//           ? ListView.builder(
//         itemCount: movies.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Dismissible(
//             onDismissed: (DismissDirection direction) {
//               setState(() {
//                 movies.removeAt(index);
//               });
//             },
//             secondaryBackground: Container(
//               child: Center(
//                 child: Text(
//                   'Delete',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               color: Colors.red,
//             ),
//             background: Container(),
//             child: MovieCard(movie: movies[index]),
//             key: UniqueKey(),
//             direction: DismissDirection.endToStart,
//           );
//         },
//       )
//           : Center(child: Text('No Items')),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movies'),
//       ),
//       body: _buildMoviesList(),
//     );
//   }
// }