import 'package:flutter/material.dart';
import 'package:my_note/My_wiget/MyTextFieid.dart';
import 'package:my_note/srevice/Http.dart';
import 'package:my_note/srevice/model_save.dart';

class Form_note extends StatefulWidget {
  final bool status;
  final note;

  const Form_note({
    this.status,
    this.note,
    Key key,
  }) : super(key: key);

  @override
  _Form_noteState createState() => _Form_noteState();
}

class _Form_noteState extends State<Form_note> {
  TextEditingController name = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController remark = TextEditingController();

  Future save() async {
    if (name.text.isEmpty || detail.text.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("กรุณากรอกข้อมูลให้ครบ"),
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
      if (widget.status) {
        update();
      } else {
        SaveNote saveNote =
            SaveNote(name: name.text, detail: detail.text, remark: remark.text);
        print(saveNoteToJson(saveNote));
        await My_http().put('/note2Put', saveNoteToJson(saveNote));
        Navigator.pop(context);
      }
    }
  }

  Future update() async {
    SaveNote saveNote =
        SaveNote(name: name.text, detail: detail.text, remark: remark.text);
    print(saveNoteToJson(saveNote));
    await My_http().post('/note2Update/' + widget.note["id"].toString(),
        saveNoteToJson(saveNote));
    Navigator.pop(context);
  }

  check() {
    if (widget.status) {
      setState(() {
        name.text = widget.note['name'];
        detail.text = widget.note['detail'];
        remark.text = widget.note['remark'];
      });
    } else {}
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: GestureDetector(
        onTap: () {},
        child: ListView(
          children: [
            MyTextFieid(
              label: "Title",
              textEditingController: name,
            ),
            mytext('Detail', detail),
            mytext('Remark', remark)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          save();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Container mytext(String label, control) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: control,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.cyan[100],
          filled: true,
          labelText: label,
        ),
        maxLines: 6,
      ),
    );
  }
}
