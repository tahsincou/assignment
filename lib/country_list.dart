import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key, }) : super(key: key);


  @override
  State<CountryScreen> createState() => _CountryScreenState();
}
class _CountryScreenState extends State<CountryScreen> {
  List _countries = [];
  Future<String> getCountries() async {
    var res = await http.get(
      //Need to provide local ip address instead of localhost
        // Uri.parse("http://localhost:8080/data/countries/"),
        Uri.parse("http://192.168.0.6:8080/data/countries/"),
        headers: {"Accept": "application/json"});
    setState(() {
      try {
        _countries = jsonDecode(res.body);
      } catch (e, s) {
        print(s);
      }
    });
    return "worked";
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Country List"),
        ),
        body: Container(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: _countries == null ? 0 : _countries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(_countries[index]["name"].toString()),
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