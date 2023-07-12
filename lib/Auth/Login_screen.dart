import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_cart/Reusable_Components/Reusable_Button.dart';
import 'package:smart_cart/Reusable_Components/Reusable_FormField.dart';
import 'package:smart_cart/AUTH/widgets/dont_have_account_widget.dart';
import 'package:smart_cart/home_layout_screen.dart';

final firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  var enteredEmail = '';
  var enteredPassword = '';
  var formKey = GlobalKey<FormState>();
  void _submit() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      try {
        final logInUserCredentials = await firebase.signInWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
        print('Login User Credentials Are : $logInUserCredentials ');

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeLayoutScreen()),
          (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? "Login Credentials Mismatch"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Lottie.network(
                              'https://assets6.lottiefiles.com/packages/lf20_yebxx6nk.json'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Welcome To Smart Cart !',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ReusableFormField(
                    formFieldValidator: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty'.toUpperCase();
                      }
                      if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                          .hasMatch(value)) {
                        return 'Please enter valid email format '.toUpperCase();
                      }
                      return null;
                    },
                    formFieldTextType: TextInputType.emailAddress,
                    formFieldLabelText: 'Email',
                    formFieldPrefixIcon: Icons.email,
                    formFieldOnSaved: (value) {
                      enteredEmail = value!;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ReusableFormField(
                    fieldMaxLines: 1,
                    isPassword: isPassword,
                    formFieldValidator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty'.toUpperCase();
                      }
                    },
                    formFieldTextType: TextInputType.visiblePassword,
                    formFieldLabelText: 'Password',
                    formFieldPrefixIcon: Icons.lock,
                    formFieldSuffixIcon: isPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    formFieldSuffixIconPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    formFieldOnSaved: (value) {
                      enteredPassword = value!;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ReusableButton(
                    buttonBackgroundColor: CupertinoColors.activeGreen,
                    buttonWidth: double.infinity,
                    buttonOnPressed: () {
                      _submit();
                    },
                    buttonText: 'Log in',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DHAWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
