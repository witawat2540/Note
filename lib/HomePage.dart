import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'About_Page.dart';
import 'My_wiget/My_Drawer.dart';
import 'Note_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _page  = Note_Page();
  String name = "";
  String email = "";


  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString(
      "name",
    ) ==
        null &&
        preferences.getString(
          "email",
        ) ==
            null) {
    } else {
      name = preferences.getString(
        "name",
      );
      email = preferences.getString(
        "email",
      );
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Note"),
      ),
      drawer: my_drawer(
        name: name,
        email: email,
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
