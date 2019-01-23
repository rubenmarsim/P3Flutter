import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_list.dart';
import 'package:we_rate_dogs/dog_model.dart';
import 'package:we_rate_dogs/new_dog_form.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'We Rate Star Wars',
      theme: new ThemeData(brightness: Brightness.dark),
      home: new MyHomePage(title: 'We Rate Star Wars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var initialDoggos = <Dog>[]
    ..add(new Dog('Luke Skywalker', 'tatooine',
        'Procedente de la colonia de asteroides de Polis Massa.'))
    ..add(new Dog('C-3PO', 'tatooine', 'Se trata de un androide de protocolo'))
    ..add(new Dog('R2-D2', 'naboo', 'Es un droide astromecanico, contraparte y amigo de C-3PO'))
    ..add(new Dog('Darth Vader', 'tatooine', 'tambien conocido por su nombre de nacimiento Anakin Skywalker'))
    ..add(new Dog('Leia Organa', 'tatooine', 'La Princesa Leia Organa de Alderaan '));

  Future<Null> _showNewDogForm() async {
    Dog newDog = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new AddDogFormPage();
        },
      ),
    );
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text(widget.title),
        actions: [
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => _showNewDogForm(),
          ),
        ],
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: new Center(
          child: new DogList(initialDoggos),
        ),
      ),
    );
  }
}
