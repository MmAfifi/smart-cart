import 'package:flutter/material.dart';

class SignUpSuccessfullyWidget extends StatefulWidget {
  const SignUpSuccessfullyWidget({Key? key}) : super(key: key);

  @override
  State<SignUpSuccessfullyWidget> createState() => _SignUpSuccessfullyWidgetState();
}

class _SignUpSuccessfullyWidgetState extends State<SignUpSuccessfullyWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 75.0,
        vertical: 300.0,
      ),
      title: Container(
        height: 60,
        color: Colors.green,
        child: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      content: Center(
          child: Column(
            children: const [
              Text(
                'Signing Up Done !',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  'data saving is successfully done',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
