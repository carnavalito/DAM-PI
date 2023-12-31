import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pi/services/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

import '../global/toast.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('MovieApp'),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff764abc),
              ),
              child: Text('Movie App'),
            ),
            ListTile(
              leading: Icon(
                Icons.add,
              ),
              title: const Text('Agregar Pelicula'),
              onTap: () async {
                await Navigator.pushNamed(context, '/add');
                setState(() {});              },
            ),
            ListTile(
              leading: Icon(
                Icons.close,
              ),
              title: const Text('Cerrar sesion'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                showToast(message: "Cerraste Sesion");
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        return Dismissible(
                          onDismissed: (direction) async {
                            await deleteMovie(snapshot.data?[index]['uid']);
                            snapshot.data?.removeAt(index);
                          },
                          confirmDismiss: (direction) async {
                            bool result = false;
                            result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Estas seguro de eliminar la pelicula ${snapshot.data?[index]['title']}?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            return Navigator.pop(
                                                context, false);
                                          },
                                          child: const Text(
                                            "Cancelar",
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            return Navigator.pop(context, true);
                                          },
                                          child: const Text(
                                            "Confirmar",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  );
                                });

                            return result;
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                          direction: DismissDirection.endToStart,
                          key: Key(snapshot.data?[index]['uid']),
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: GFAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data?[index]['img']),
                                      shape: GFAvatarShape.standard),
                                  title: Text(snapshot.data?[index]['title']),
                                  subtitle:
                                      Text(snapshot.data?[index]['genre']),
                                  trailing: Text(snapshot.data?[index]['year']),
                                  onTap: (() async {
                                    await Navigator.pushNamed(context, "/edit",
                                        arguments: {
                                          "title": snapshot.data?[index]
                                              ['title'],
                                          "director": snapshot.data?[index]
                                              ['director'],
                                          "genre": snapshot.data?[index]
                                              ['genre'],
                                          "img": snapshot.data?[index]['img'],
                                          "year": snapshot.data?[index]['year'],
                                          "synopsis": snapshot.data?[index]
                                              ['synopsis'],
                                          "uid": snapshot.data?[index]['uid'],
                                        });
                                    setState(() {});
                                  }),
                                )
                              ],
                            ),
                          ),
                        );
                      })));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
