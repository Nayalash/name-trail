import 'package:flutter/material.dart';
import 'package:name_trail/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset('images/logo.png'),
            SizedBox(
              height: 50,
            ),
            FlatButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
                child: Image.asset('images/go.png')),
          ],
        ),
      ),
    );
  }
}
