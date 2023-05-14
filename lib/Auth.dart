import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list/Signup.dart';
import 'package:to_do_list/login.dart';

class Auth extends StatefulWidget {
  static const routename = '/auth';
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin ? Login() : Signup();
}
