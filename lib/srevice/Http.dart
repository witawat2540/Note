import 'dart:convert';

import 'package:http/http.dart' as client;

class My_http{
  var http = client.Client();

  final String url = 'http://192.168.1.42:3000';
  final headers = {'Content-Type': 'application/json'};


  get(path)async{
    return await http.get(url+path,headers: headers);
  }

  put(path,body)async{
    return await http.put(url+path,headers: headers,body: body);
  }

  post(path,body)async{
    return await http.post(url+path,headers: headers,body: body);
  }
  delete(path)async{
    return await http.delete(url+path);
  }
}