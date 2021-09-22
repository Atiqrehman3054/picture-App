import 'package:flutter/material.dart';

import 'Selected.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itemList;
  List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }

  loadList() {
    itemList = List();
    selectedList = List();
    itemList.add(Item("", 1));
    itemList.add(Item("", 2));
    itemList.add(Item("", 3));
    itemList.add(Item("", 4));
    itemList.add(Item("", 4));
    itemList.add(Item("", 4));
    itemList.add(Item("", 5));
    itemList.add(Item("", 6));
    itemList.add(Item("", 7));
    itemList.add(Item("", 8));
    itemList.add(Item("", 9));
    itemList.add(Item("", 10));
    itemList.add(Item("", 11));
    itemList.add(Item("", 12));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [

                  Icon(Icons.arrow_back_ios_outlined),
                  SizedBox(
                    width: 45,
                  ),
                  Column(
                    children: [
                      Text('PROBLEMS AREAS?',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                      Text('SELECT ALL THAT APPLY'),
                    ],
                  )


                ],
              ),
              Container(
                height: 600,
                width: 550,
                child: GridView.builder(
                    itemCount: itemList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.56,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridItem(
                            item: itemList[index],
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selectedList.add(itemList[index]);
                                } else {
                                  selectedList.remove(itemList[index]);
                                }
                              });
                              print("$index : $value");
                            },
                            key: Key(itemList[index].rank.toString())),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Text("itemList.length/selectedList"),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 5),
                    child: Text(
                        "DONE!".toUpperCase(),
                        style: TextStyle(fontSize: 21)
                    ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.brown[300]),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.brown[200]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.brown[300])
                          )
                      )
                  ),
                  onPressed: () => null
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(selectedList.length < 1
          ? "Multi Selection"
          : "${selectedList.length} item selected"),
      actions: <Widget>[
        selectedList.length < 1
            ? Container()
            : InkWell(
            onTap: () {
              setState(() {
                for (int i = 0; i < selectedList.length; i++) {
                  itemList.remove(selectedList[i]);
                }
                selectedList = List();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ))
      ],
    );
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}