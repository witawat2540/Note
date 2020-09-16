import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class About_Page extends StatefulWidget {
  @override
  _About_PageState createState() => _About_PageState();
}

class _About_PageState extends State<About_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  save() async {
    if (name.text.isEmpty || email.text.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("ไม่สามารถบันทึกรายการได้"),
                actions: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                    color: Colors.red,
                    textColor: Colors.white,
                  )
                ],
              ));
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("name", name.text);
      preferences.setString("email", email.text);

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("บันทึกสำเร็จ"),
                actions: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                    color: Colors.red,
                    textColor: Colors.white,
                  )
                ],
              ));
//      print(preferences.getString("name"));
    }
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
//    preferences.getString(
//      "name",
//    );
//    preferences.getString(
//      "email",
//    );
    if (preferences.getString(
              "name",
            ) ==
            null &&
        preferences.getString(
              "email",
            ) ==
            null) {
    } else {
      name.text = preferences.getString(
        "name",
      );
      email.text = preferences.getString(
        "email",
      );
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.black87,
                ),
              ],
            ),
            Center(
              child: Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.black87,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: RaisedButton(
                child: Text("Save"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  save();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
