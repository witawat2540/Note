import 'package:flutter/material.dart';

import 'About_Page.dart';
import 'My_wiget/My_Drawer.dart';
import 'Note_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _page  = Note_Page();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Note"),
      ),
      drawer: my_drawer(
        name: "Witawatd",
        email: "Test@gmail.com",
        onTap_Note: (){
          setState(() {
            _page = Note_Page();
            Navigator.pop(context);
          });
        },
        onTap_about: (){
          setState(() {
            _page = About_Page();
            Navigator.pop(context);
          });
        },
      ),
      body: _page,
    );
  }
}
