import 'package:flutter/material.dart';
import 'package:marathon_ui/profiles/profile1/profile_1.dart';
import 'package:marathon_ui/profiles/profile2/profile_2.dart';
import 'package:marathon_ui/profiles/profile3/profile_3.dart';
import 'package:marathon_ui/profiles/profile4/profile_4.dart';
import 'package:marathon_ui/profiles/profile5/profile_5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Profile5(),
    );
  }
}
