
import 'package:flutter/material.dart';
import 'package:picture_app/UI%20Firebase/model/sidebar.dart';

import '../../constants.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({@required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 42.0,
            height: 42.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                gradient: item.background),
            child: item.icon),
        SizedBox(width: 12),
        Container(
          child: Text(
            item.title,
            style: kCalloutLabelStyle,
          ),
        ),
      ],
    );
  }
}
