import 'package:firebase_login/components/constants_variables.dart';
import 'package:firebase_login/components/loading.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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
        : SafeArea(
            child: Scaffold(
              // backgroundColor: const Color(0XFF233b5e),
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [Color(0XFF0b2142), Color(0XFF233b5e)])),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Row(
                          children: [
                            Text('Register',
                                style: GoogleFonts.caveat(
                                    color: Colors.white, fontSize: 25)),
                            const SizedBox(width: 10),
                            const Icon(Typicons.user_add,
                                color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(bottom: 150),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: GoogleFonts.caveat(
                                      color: Colors.white,
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Sign in to continue',
                                  style: GoogleFonts.caveat(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF2d496f),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 15),
                                        child: Text('EMAIL',
                                            style: GoogleFonts.kalam(
                                                color: Colors.white70,
                                                letterSpacing: 1)),
                                      ),
                                      TextFormField(
                                        style: GoogleFonts.caveat(
                                            color: Colors.white, fontSize: 22),
                                        cursorColor: Colors.white,
                                        decoration: inputDecoration.copyWith(
                                            hintText: 'Email',
                                            prefixIcon: const Icon(
                                                Linecons.mail,
                                                size: 20,
                                                color: Colors.white)),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Enter an email';
                                          } else if (!RegExp(r'\S+@\S+\.\S+')
                                              .hasMatch(val)) {
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
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF2d496f),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 15),
                                        child: Text('PASSWORD',
                                            style: GoogleFonts.kalam(
                                                color: Colors.white70,
                                                letterSpacing: 1)),
                                      ),
                                      TextFormField(
                                        style: GoogleFonts.caveat(
                                            color: Colors.white, fontSize: 22),
                                        cursorColor: Colors.white,
                                        decoration: inputDecoration.copyWith(
                                            hintText: 'Password',
                                            prefixIcon: const Icon(
                                                Linecons.lock,
                                                size: 20,
                                                color: Colors.white)),
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
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              "Sign in failed. Please try entering valid email and password!";
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sign In',
                                        style: GoogleFonts.kalam(
                                            color: Colors.blueGrey.shade900,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                error != ''
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(error,
                                            style: GoogleFonts.kalam(
                                                color: Colors.red.shade400,
                                                fontSize: 16)),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
