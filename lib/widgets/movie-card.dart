import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(movie.img),
            ),
            title: Text(movie.title),
            subtitle: Text(movie.genre),
            trailing: Text(movie.year),
          )
        ],
      ),
    );
  }
}