import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrd_prefs/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 32),
              ),
              TextField(),
              TextField(),
              ElevatedButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setBool("Login", true);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      )),
    );
  }
}
