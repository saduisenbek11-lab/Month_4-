import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/home.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    ));