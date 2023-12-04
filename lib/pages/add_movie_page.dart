import 'package:flutter/material.dart';
import 'package:pi/services/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  TextEditingController titleController = TextEditingController(text: "");
  TextEditingController synopsisController = TextEditingController(text: "");
  TextEditingController directorController = TextEditingController(text: "");
  TextEditingController genreController = TextEditingController(text: "");
  TextEditingController imgController = TextEditingController(text: "");
  TextEditingController yearController = TextEditingController(text: "");

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Pelicula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el titulo',
              ),
            ),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el genero de la pelicula',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addMovie(titleController.text).then((_) {
                  Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
