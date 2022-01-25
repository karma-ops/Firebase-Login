import 'package:firebase_login/components/constants_variables.dart';
import 'package:firebase_login/components/loading.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);
  final Function toggleView;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String error = '';

  bool loading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up'),
              actions: [
                TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Row(
                    children: const [
                      Text('Sign In', style: TextStyle(color: Colors.white)),
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
                          dynamic result = await _auth.registerWithEmailAndPass(
                              email, password);
                          if (result == null) {
                            if (mounted) {
                              setState(() {
                                error = "Registration failed!";
                                loading = false;
                              });
                            }
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
                            'Register',
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
}
