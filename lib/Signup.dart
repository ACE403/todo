import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list/main.dart';
import './login.dart';
import 'Auth.dart';
import 'home.dart';

class Signup extends StatelessWidget {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();
  static const routename = '/signup';

  @override
  Widget build(BuildContext context) {
    Future signup() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim(),
      );
      Navigator.of(context).pushNamed(home.routename);
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signup.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Signup',
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.35,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(home.routename);
                          },
                          child: Text(
                            'Already Registered?',
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 50,
                        width: screenWidth * 0.4,
                        child: ElevatedButton(
                          onPressed: signup,
                          child: Text('Signup'),
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
