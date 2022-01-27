import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var inputDecoration = InputDecoration(
    errorStyle: TextStyle(color: Colors.red.shade400),
    hintStyle: GoogleFonts.caveat(
      color: Colors.white,
    ),
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    // ),
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    // ),
    // errorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    // ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    fillColor: const Color(0XFF2d496f),
    filled: true);
