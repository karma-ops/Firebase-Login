import 'package:firebase_login/components/constants_variables.dart';
import 'package:firebase_login/components/loading.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  final Function toggleView;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Sign In'),
              actions: [
                TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Row(
                    children: const [
                      Text('Register', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      cursorColor: Colors.blueGrey[900],
                      decoration: inputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter an email';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: Colors.blueGrey[900],
                      decoration:
                          inputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) {
                        if (val!.length < 6) {
                          return 'Passowrd must be at least 6 characters';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  "Sign in failed. Please try entering valid email and password";
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    error != ''
                        ? Text(error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14))
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          );
  }

  // signInAnon() {
  //   return TextButton(
  //     onPressed: () async {
  //       dynamic result = await _auth.signInAnon();
  //       result == null
  //           ? print('error signing in')
  //           : print('signed in successfully. Result : ${result.uid}');
  //     },
  //     child: Container(
  // width: 100,
  // height: 40,
  // decoration: BoxDecoration(
  //   color: Colors.orange.shade300,
  //   borderRadius: BorderRadius.circular(10),
  // ),
  //         child: const Center(child: Text('Sign In Anon'))),
  //   );
  // }
}
