import 'package:flutter/material.dart';
class MyTextFieid extends StatelessWidget {
final TextEditingController textEditingController;
final Function changed ;
final String label;
  const MyTextFieid({
    this.textEditingController,
    this.label,
    this.changed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextField(
        controller: textEditingController,
        onChanged: changed,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.blueGrey),
            labelText: label,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.cyan[100]
        ),
      ),
    );
  }
}
