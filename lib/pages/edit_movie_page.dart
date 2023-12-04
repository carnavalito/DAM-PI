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
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: titleController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;



    GridView items = GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 3,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(3, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: TextField(
        controller: synopsisController,
        decoration: const InputDecoration(labelText: 'Synopsis'),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        // <-- SEE HERE
        maxLines: 10, // <-- SEE HERE
        // softWrap: true,
      ),
    );

    Widget editButton = Column(children: [
      ElevatedButton(
          onPressed: () async {
            await updateMovie(arguments['uid'], titleController.text,
                    synopsisController.text)
                .then((_) {
              Navigator.pop(context);
            });
          },
          child: const Text("Actualizar"))
    ]);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Movie'),
        ),
        body:
        ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Image.network(
              arguments['img'],
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
            editButton
          ],
        ),


    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
