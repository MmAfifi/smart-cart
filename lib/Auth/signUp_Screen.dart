import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_cart/AUTH/Login_screen.dart';
import 'package:smart_cart/Reusable_Components/Reusable_Button.dart';
import 'package:smart_cart/Reusable_Components/Reusable_FormField.dart';
import 'package:smart_cart/AUTH/widgets/password_mismatch_error_widget.dart';
import 'package:smart_cart/AUTH/widgets/siging_up_succefully_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var signUpFirstNameController = TextEditingController();
  var signUpSecondNameController = TextEditingController();
  var signUpEmailController = TextEditingController();
  var signUpPasswordController = TextEditingController();
  var signUpConfirmPasswordController = TextEditingController();
  var signUpFormKey = GlobalKey<FormState>();
  final firebase = FirebaseAuth.instance;

  // var dbHelper;
  bool isPassword = true;

  @override
  initState() {
    super.initState();
    // dbHelper = DatabaseHelper();
  }

  signUp() async {
    // print('First Name is : ${signUpFirstNameController.text}');
    // print('Second Name is : ${signUpSecondNameController.text}');
    // print('Sign up Email is : ${signUpEmailController.text}');
    // print('Sign up Password is : ${signUpPasswordController.text}');
    // print('Confirm Password is : ${signUpConfirmPasswordController.text}');

    if (signUpFormKey.currentState!.validate()) {
      if (signUpPasswordController.text !=
          signUpConfirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (_) => const PasswordMismatchErrorWidget(),
        );
        print('Error : Password Mismatch');
      } else {
        try {
          final userCredentials = await firebase.createUserWithEmailAndPassword(
            email: signUpEmailController.text,
            password: signUpConfirmPasswordController.text,
          );
          signUpFormKey.currentState!.save();
          print('User Credentials Are : $userCredentials ');
          Future.delayed(
            const Duration(seconds: 2),
            () {
              const CircularProgressIndicator();
            },
          );
          showDialog(
            context: context,
            builder: (_) => const SignUpSuccessfullyWidget(),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign Up Done Successfully"),
            ),
          );
          FirebaseFirestore.instance
              .collection('Users')
              .doc(userCredentials.user!.uid)
              .set({
            'username': signUpFirstNameController.text,
            'email': signUpEmailController.text,
            'password': signUpConfirmPasswordController.text,
          });
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          );
        } on FirebaseAuthException catch (error) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? "Authentication Failed"),
            ),
          );
        }
        // UserModel uModel = UserModel(
        //   signUpEmailController.text,
        //   signUpPasswordController.text,
        //   // UserModel.generateUserId(),
        // );

        // await dbHelper.saveData(uModel).then(
        //   (userData) {
        //     showDialog(
        //       context: context,
        //       builder: (_) => const SignUpSuccessfullyWidget(),
        //       //sign up done successfully
        //     );
        //     print('saved');
        //   },
        // ).catchError((error) {
        //   print('Error Happened While Signing Up : $error');
        // },
        // );
      }
    }
  }

  validateEmail(String email) {
    final emailReg = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailReg.hasMatch(email);
  }

  validatePassword(String password) {
    final passwordReg =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    return passwordReg.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableFormField(
                        formFieldController: signUpFirstNameController,
                        formFieldTextType: TextInputType.name,
                        formFieldLabelText: 'First Name',
                        formFieldPrefixIcon: Icons.supervised_user_circle,
                        formFieldValidator: (value) {
                          if (value!.isEmpty) {
                            return 'First Name must not be empty'.toUpperCase();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ReusableFormField(
                        formFieldValidator: (value) {
                          if (value!.isEmpty) {
                            return 'Second Name must not be empty'
                                .toUpperCase();
                          }
                        },
                        formFieldController: signUpSecondNameController,
                        formFieldTextType: TextInputType.name,
                        formFieldLabelText: 'Second Name',
                        formFieldPrefixIcon: Icons.supervised_user_circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableFormField(
                  formFieldValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email must not be empty'.toUpperCase();
                    }
                    if (!validateEmail(value)) {
                      return 'please enter valid email format'.toUpperCase();
                    }
                    return null;
                  },
                  formFieldController: signUpEmailController,
                  formFieldTextType: TextInputType.emailAddress,
                  formFieldLabelText: 'Email',
                  formFieldPrefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableFormField(
                    isPassword: isPassword,
                    fieldMaxLines: 1,
                    formFieldValidator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty'.toUpperCase();
                      }
                      if (!validatePassword(value)) {
                        return 'must be at least 8 characters\nat least 1 capital Letter\nat least 1 small Letter\nat least 1 special character \nand at least 1 number'
                            .toUpperCase();
                      }
                    },
                    formFieldController: signUpPasswordController,
                    formFieldTextType: TextInputType.visiblePassword,
                    formFieldLabelText: 'Password',
                    formFieldPrefixIcon: Icons.lock,
                    formFieldSuffixIcon: isPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    formFieldSuffixIconPressed: () {
                      setState(
                        () {
                          isPassword = !isPassword;
                        },
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                ReusableFormField(
                    isPassword: isPassword,
                    fieldMaxLines: 1,
                    formFieldValidator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm Password must not be empty'
                            .toUpperCase();
                      }
                    },
                    formFieldController: signUpConfirmPasswordController,
                    formFieldTextType: TextInputType.visiblePassword,
                    formFieldLabelText: 'Confirm Password',
                    formFieldPrefixIcon: Icons.lock,
                    formFieldSuffixIcon: isPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    formFieldSuffixIconPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }),
                const SizedBox(
                  height: 30,
                ),
                ReusableButton(
                  buttonWidth: double.infinity,
                  buttonText: 'Sign Up',
                  buttonBackgroundColor: Colors.blue,
                  buttonOnPressed: () {
                    signUp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
