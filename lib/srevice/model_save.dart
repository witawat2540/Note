// To parse this JSON data, do
//
//     final saveNote = saveNoteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SaveNote saveNoteFromJson(String str) => SaveNote.fromJson(json.decode(str));

String saveNoteToJson(SaveNote data) => json.encode(data.toJson());

class SaveNote {
  SaveNote({
    @required this.name,
    @required this.detail,
    @required this.remark,
  });

  final String name;
  final String detail;
  final String remark;

  factory SaveNote.fromJson(Map<String, dynamic> json) => SaveNote(
    name: json["name"] == null ? null : json["name"],
    detail: json["detail"] == null ? null : json["detail"],
    remark: json["remark"] == null ? null : json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "detail": detail == null ? null : detail,
    "remark": remark == null ? null : remark,
  };
}
