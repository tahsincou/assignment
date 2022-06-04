import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, }) : super(key: key);


  @override
  State<UserScreen> createState() => _UserScreenState();
}
class _UserScreenState extends State<UserScreen> {
   List _users = [];
  Future<String> getUsers() async {
    var res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"});
    setState(() {
      try {
        _users = jsonDecode(res.body);
        print(_users[1]["name"]);
      } catch (e, s) {
        print(s);
      }
    });
    return "worked";
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: Container(
          child: ListView.separated(
            itemCount: _users == null ? 0 : _users.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(_users[index]["name"].toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 10,
                color: Colors.grey,
              );
            },
          ),
        ));
  }
}