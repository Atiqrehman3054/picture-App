import 'package:flutter/material.dart';
import 'package:http/http.dart' show  get;
import 'package:picture_app/Widgets/Image_list.dart';
import 'package:picture_app/model/Image_file.dart';
import 'dart:convert';

class Pic extends StatefulWidget {

  @override
  _PicState createState() => _PicState();
}

class _PicState extends State<Pic> {

  int count = 0;
  List<ImageModel> images = [];


  Future<void> fetchImage() async {
    count++;

    var response = await get(Uri.parse('http://jsonplaceholder.typicode.com/photos/$count'));
    var imageModel = ImageModel.formJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text('Image'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,

        ),
      ),
    );
  }

}
