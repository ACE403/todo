import 'package:flutter/material.dart';
import 'package:to_do_list/main.dart';
import './signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const routename = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();
  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim());
    Navigator.of(context).pushNamed(home.routename);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12,
                    right: 40,
                    left: 40),
                child: Column(
                  children: [
                    TextField(
                      controller: EmailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: PasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      textInputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.53,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Signup.routename);
                          },
                          child: Text(
                            'New User?',
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 50,
                        width: screenWidth * 0.4,
                        child: ElevatedButton(
                          onPressed: logIn,
                          child: Text('Login'),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
