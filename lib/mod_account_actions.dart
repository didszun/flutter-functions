import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_functions/dev_login_credentials.dart'; // demo users "users"

class AccoutLogin extends StatefulWidget {
  const AccoutLogin({super.key});

  @override
  _AccoutLoginState createState() => _AccoutLoginState();
}

class _AccoutLoginState extends State<AccoutLogin> {
  // List <dynamic> detailsData = [];
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User does not exist.';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match.';
      }
      return ''; // 'LOGGED IN, but no login code implemented, DUDE!!.'; // TODO
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist.';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'login / sign-up',
      //logo: AssetImage('assets/images/ASSET PATH'),
      onLogin: _authUser,
      //onSignup: _signupUser,

      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: Icons.sports_baseball,
          label: 'Google',
          callback: () async {
            debugPrint('start google sign in');
            await Future.delayed(loginTime);
            debugPrint('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: Icons.facebook,
          label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: Icons.arrow_circle_down_rounded,
          label: 'github',
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AccoutLogin(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}