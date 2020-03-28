import 'package:flutter/material.dart';

class SocialDistancing extends StatefulWidget {
  @override
  _SocialDistancingState createState() => _SocialDistancingState();
}

class _SocialDistancingState extends State<SocialDistancing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stay in"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Did you practise social distancing today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}