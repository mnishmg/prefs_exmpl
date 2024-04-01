import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name;
  var nameController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    // Function to get data
    getData();
  }

  void getData() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Prefs')),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome! $name',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: nameController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', nameController.text.toString());
                },
                child: Text('Save'))
          ],
        ),
      )),
    );
  }
}