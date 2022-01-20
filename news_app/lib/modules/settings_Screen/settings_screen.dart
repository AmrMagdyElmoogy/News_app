import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hi Settings!',
        style: TextStyle(
          fontFamily: 'Fav',
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
