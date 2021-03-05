import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pics/src/app_mixin.dart';
import 'package:http/http.dart' as http;
import 'package:pics/src/models/image_model.dart';
import 'package:pics/src/widgets/image_list.dart';

//Widget
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
} //end of Widget class

//WidgetState
class _AppState extends State<App> with Methodable {
  //#region PROPERTIES
  //changing this variables call setState
  int counter = 0;
  List<ImageModel> images = [];
  //#endregion PROPERTIES
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buildScaffold(),
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody() {
    return Center(
      child: ImageList(images),
    );
  }

  Widget buildFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              counter = 0;
            });
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ],
    );
  }

  void fetchImage() async {
    counter++;
    //for old http 12
    // String url = 'https://jsonplaceholder.typicode.com/photos/${counter}';
    // var res = await get(url);
    // var parsedJson = json.decode(res.body);
    // var image = ImageModel.fromMap(parsedJson);
    // print(image);

    // new http 13 uri
    Uri uri = Uri.https('jsonplaceholder.typicode.com', '/photos/$counter', {'q': '{https}'});

    var res = await http.get(uri);
    var parsedJson = json.decode(res.body);
    final image = ImageModel.fromMap(parsedJson);
    setState(() {
      images.add(image);
    });
    print(image);
    print(parsedJson);
  }
} //end of WidgetState class
