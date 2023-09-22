// Import flutter helper library
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  final List<ImageModel> images;

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var ImageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });

  }
@override
  Widget build(context) {
    return MaterialApp(
          home: Scaffold(
        body: ImageList(images),
            floatingActionButton: FloatingActionButton(
             child: Icon(Icons.add),
              onPressed: fetchImage,
            ),
            appBar: AppBar(
              title: Text("Lets see some images"),
            ),
          ),
    );
  }
}

