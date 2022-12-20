import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_florist/features/networking/token_repository.dart';
import 'package:journal_florist/utilities/app_styles.dart';

import 'login.dart';

class SignOut extends StatefulWidget {
  SignOut({Key? key}) : super(key: key);

  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final _deleteToken = TokenRepository();

  @override
  Widget build(BuildContext context) {
    final _actionPositive = ElevatedButton(
      child: const Text('Logout'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Styles.primaryAccent,
        ),
      ),
      onPressed: () {
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                _deleteToken.deleteUserToken();
                return LoginPage();
              },
            ),
          );
        });
      },
    );

    final _actionNegative = TextButton(
      child: const Text(
        'Cancel',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    return Center(
      child: AlertDialog(
        title: const Text('Please Confirm'),
        content: const Text(
          'Are you sure to Logout?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [_actionPositive, _actionNegative],
      ),
    );
  }
}
