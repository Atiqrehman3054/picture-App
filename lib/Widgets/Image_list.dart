import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_app/model/Image_file.dart';


class ImageList extends StatelessWidget {
  final  List<ImageModel> images;
   ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context , int index){

        return buildImage(images[index]);

      },
    );
  }
}



Widget buildImage(ImageModel image){
return Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey,width: 20),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
  ),
  padding: EdgeInsets.all(1.0),
  margin: EdgeInsets.all(20.0),
  child:  Column(
    children: [
      Image.network(image.url),
      Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
        child: Text(

            image.title),
      ),
    ],
  ),

);
}