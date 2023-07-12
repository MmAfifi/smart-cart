import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Row(
        children: [
          Icon(
            Icons.logout,
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            'Log out',

          ),
        ],
      ),
      onTap: () {
        FirebaseAuth.instance.signOut();
      },
    );
  }
}
