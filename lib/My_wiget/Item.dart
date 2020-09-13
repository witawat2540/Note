import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyItem extends StatelessWidget {
  final String name;
  final Function onTap_edit,onTap_delete;
  const MyItem({
    this.name = '',
    this.onTap_delete,
    this.onTap_edit,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.only(right: 5, left: 5,bottom: 5,top: 5),
        child: ListTile(
          title: Text("Name : "+name),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          onTap: onTap_edit,
          caption: "Edit",
          icon: Icons.edit,
          color: Colors.blueAccent,
        ),
        IconSlideAction(
          onTap:onTap_delete,
          caption: "Delete",
          icon: Icons.delete,
          color: Colors.red,
        ),
      ],
    );
  }
}