import 'package:flutter/material.dart';
import 'package:contact_list_assignment_mod_7/ContactList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contactlist(),
      );
  }
}

