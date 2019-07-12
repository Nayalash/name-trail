import 'package:flutter/material.dart';
import 'package:name_trail/screens/search_screen.dart';
import 'dart:async';
import 'package:name_trail/services/API.dart' as nameAPI;

class OutputScreen extends StatefulWidget {
  final String name;

  OutputScreen({@required this.name});

  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  dynamic data;
  bool isLoading = true;

  Future<void> getData() async {
    final decoded = await nameAPI.getData(widget.name);
    setState(() {
      isLoading = false;
      data = decoded;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              !(data is List)
                                  ? "Unknown"
                                  : "Origin: ${data[0]['usages'][0]['usage_full']} \n\nGender: "
                                      "${nameAPI.toFullGenderName(data[0]['usages'][0]['usage_gender'])}",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()),
                              );
                            },
                            child: Image.asset('images/back.png')),
                      ],
                    ),
            ),
          ),
        ));
  }
}
