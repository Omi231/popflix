import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreTabScreen extends StatefulWidget {
  @override
  _MoreTabScreenState createState() => _MoreTabScreenState();
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Nothing to Set Here",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
