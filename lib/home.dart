import 'package:flutter/material.dart';
import 'package:to_do_list/login.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home extends StatefulWidget {
  static const routename = '/home';
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          }
          return Login();
        },
      ));
}
