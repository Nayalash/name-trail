import 'package:flutter/material.dart';
import 'package:name_trail/screens/output_screen.dart';
import 'package:name_trail/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 50, right: 50, bottom: 10),
          child: Container(
            child: Column(
              children: <Widget>[

                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: kTextFieldInputDecoration,

                  onChanged: (value) {
                    name = value;
                  },
                ),

                SizedBox(
                  height: 150,
                ),

                FlatButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OutputScreen(name: name)),
                  );

                },
                    child: Image.asset('images/find.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
