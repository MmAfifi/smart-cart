import 'package:flutter/material.dart';

class PasswordMismatchErrorWidget extends StatefulWidget {
  const PasswordMismatchErrorWidget({Key? key}) : super(key: key);

  @override
  State<PasswordMismatchErrorWidget> createState() => _PasswordMismatchErrorWidgetState();
}

class _PasswordMismatchErrorWidgetState extends State<PasswordMismatchErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 75.0,
        vertical: 300.0,
      ),
      title: Container(
        height: 60,
        color: Colors.red,
        child: const Icon(
          Icons.error,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      content: Center(
          child: Column(
            children: const [
              Text(
                'Error !',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  'Password Mismatch Confirm Password',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
