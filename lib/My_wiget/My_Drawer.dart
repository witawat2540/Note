import 'package:flutter/material.dart';

class my_drawer extends StatelessWidget {
  final String name,email;
  final Function onTap_Note,onTap_about;
  const my_drawer({
    this.name = '',
    this.email = '',
    this.onTap_about,
    this.onTap_Note,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Name : " + name),
            accountEmail: Text("Email : "+ email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text('My Note'),
            leading: Icon(Icons.note),
            onTap: onTap_Note,
          ),
          ListTile(
            title: Text('About Me'),
            onTap: onTap_about,
            leading: Icon(Icons.account_circle_rounded),
          )
        ],
      ),
    );
  }
}