import 'package:flutter/material.dart';

var inputDecoration = InputDecoration(
    hintStyle: const TextStyle(color: Colors.white),
    hintText: 'Password',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    fillColor: Colors.grey,
    filled: true);
