import 'package:flutter/material.dart';
import 'package:pi/services/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

class EditMoviePage extends StatefulWidget {
  const EditMoviePage({super.key});

  @override
  State<EditMoviePage> createState() => _EditMoviePageState();
}

class _EditMoviePageState extends State<EditMoviePage> {
  TextEditingController titleController = TextEditingController(text: "");
  TextEditingController synopsisController = TextEditingController(text: "");
  TextEditingController directorController = TextEditingController(text: "");
  TextEditingController genreController = TextEditingController(text: "");
  TextEditingController imgController = TextEditingController(text: "");
  TextEditingController yearController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    titleController.text = arguments["title"];
    synopsisController.text = arguments["synopsis"];
    directorController.text = arguments["director"];
    genreController.text = arguments["genre"];
    imgController.text = arguments["img"];
    yearController.text = arguments["year"];

    Widget titleSection = Container(
      padding: const EdgeInsets.only(left:32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: titleController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: TextField(
        controller: synopsisController,
        decoration: const InputDecoration(labelText: 'Synopsis'),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 10,
      ),
    );
    Widget genre = Container(
      padding: const EdgeInsets.only(left:32),
      child: TextField(
        controller: genreController,
        decoration: const InputDecoration(labelText: 'Genero'),
      ),
    );
    Widget director = Container(
      padding: const EdgeInsets.only(left:32),
      child: TextField(
        controller: directorController,
        decoration: const InputDecoration(labelText: 'Director'),
      ),
    );

    Widget year = Container(
      padding: const EdgeInsets.only(left:32),
      child: TextField(
        controller: yearController,
        decoration: const InputDecoration(labelText: 'Año'),
      ),
    );
    Widget img = Container(
      padding: const EdgeInsets.only(left:32),
      child: TextField(
        controller: imgController,
        decoration: const InputDecoration(labelText: 'Image URL'),
      ),
    );

    Widget editButton = Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.amber,
            backgroundColor:
                const Color(0xff764abc), // Text Color (Foreground color)
          ),
          onPressed: () async {
            await updateMovie(
                    arguments['uid'],
                    directorController.text,
                    genreController.text,
                    imgController.text,
                    synopsisController.text,
                    titleController.text,
                    yearController.text)
                .then((_) {
              Navigator.pop(context);
            });
          },
          child: const Text("Actualizar"))
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MovieApp'),
        backgroundColor: const Color(0xff764abc),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Image.network(
            arguments['img'],
            width: 600,
            height: 400,
            fit: BoxFit.cover,
          ),
          titleSection,
          genre,
          director,
          year,
          textSection,
          img,
          editButton
        ],
      ),
    );
  }
}
