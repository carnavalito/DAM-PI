import 'package:flutter/material.dart';
import 'package:pi/services/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

import '../widgets/form_container_widget.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  bool isCreated = false;
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
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('MovieApp'),
        backgroundColor: const Color(0xff764abc),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Agregar Pelicula",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: titleController,
                hintText: "Titulo",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: imgController,
                hintText: "Url de la imagen",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: genreController,
                hintText: "Genero",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: synopsisController,
                hintText: "Synopsis",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: directorController,
                hintText: "Director",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: yearController,
                hintText: "Año",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await addMovie(
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
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xff764abc),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: isCreated
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Agregar Pelicula",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
