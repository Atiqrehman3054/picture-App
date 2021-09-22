import 'package:flutter/material.dart';
import 'package:picture_app/screens/SelectedList.dart';

class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({this.item, this.isSelected, this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
              widget.isSelected(isSelected);
            });
          },
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                maxRadius: 50,
                minRadius: 25,
                backgroundColor:Colors.brown[400],
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('REALATIONSHIP',style: TextStyle(color: Colors.black),)),
              ),
              isSelected
                  ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  ),
                ),
              )
                  : Container()
            ],
          ),
        ),
      ],
    );
  }
}