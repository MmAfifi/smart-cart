import 'package:flutter/material.dart';
import 'package:smart_cart/AUTH/signUp_Screen.dart';


class DHAWidget extends StatelessWidget {
  const DHAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Don\'t Have an Account ?'),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: const Text(
            'Register Now',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
