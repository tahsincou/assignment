import 'package:assignment_tahsin/country_list.dart';
import 'package:assignment_tahsin/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/initialScreen',
      routes: {
        '/initialScreen': (context) => const InitialScreen(),
        '/userScreen': (context) => const UserScreen(),
        '/countryScreen': (context) => const CountryScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter web service'),
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                text: 'Md Tahsin Hasan',
                style: textTheme.headline5,
              ),
            ),
            const Divider(height: 35),
            const SizedBox(
              height: 30,
            ),
            const Text("This list generated from a web api"),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
                //Used for json api call from online
                label: const Text(
                  "User List Online",
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/userScreen");
                }),
            const SizedBox(
              height: 20,
            ),
            const Divider(height: 35),
            const Center(
              child: Text("This list generated from my web service"),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
                //Used for json api call from my Web Service
                label: const Text("   Country LIst   "),
                onPressed: () {
                  Navigator.pushNamed(context, "/countryScreen");
                }),
          ],
        ),
      ),
    );
  }
}
