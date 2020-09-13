import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_note/srevice/Http.dart';

import 'package:http/http.dart' as http;

import 'Form_node.dart';
import 'My_wiget/Item.dart';
import 'My_wiget/MyTextFieid.dart';

class Note_Page extends StatefulWidget {
  @override
  _Note_PageState createState() => _Note_PageState();
}

class _Note_PageState extends State<Note_Page> {
  List note_list = [];
  TextEditingController _search = TextEditingController();

  Future getdata() async {
    http.Response res = await My_http().get("/note2All");
    print(res.body);
    setState(() {
      note_list = json.decode(res.body);
    });
    print(note_list[0]);
  }

  Future delete(id) async {
    await My_http().delete('/note2Delete/' + id.toString());
    getdata();
  }

  Future search() async {
    var key = {};
    key["keyword"] = _search.text;
    http.Response response = await My_http().post("/note2Search", jsonEncode(key));
    setState(() {
      note_list = jsonDecode(response.body);
      print(note_list);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //FocusScope.of(context).unfocus();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contex) => Form_note(
                        status: false,
                      ))).then((value) {
            setState(() {
              getdata();
            });
          });
        },
        child: Icon(Icons.add),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            print("Click");
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextFieid(
                  label: "Search",
                  textEditingController: _search,
                  changed: (value) {
                    search();
                  },
                ),
                Container(
                  height: 500,
                  // child: ListView(
                  //   children: [
                  //     MyItem(name: "Test 1",)
                  //   ],
                  // ),
                  child: ListView.builder(
                      itemCount: note_list.length,
                      itemBuilder: (BuildContext context, index) {
                        return MyItem(
                          name: note_list[index]['name'],
                          onTap_edit: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => Form_note(
                                          status: true,
                                          note: note_list[index],
                                        ))).then((value) {
                              setState(() {
                                getdata();
                              });
                            });
                          },
                          onTap_delete: () {
                            delete(note_list[index]["id"]);
                          },
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}
