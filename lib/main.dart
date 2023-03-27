import 'package:authtest/homescreen.dart';
import 'package:authtest/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Mainwidget());
}

class Mainwidget extends StatelessWidget {
  const Mainwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Center(child: Text("data")),
              ),
              body: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("something went wrong"));
                    } else if (snapshot.hasData) {
                      print("working fine");
                      return HomeScreen();
                    } else {
                      return LoginScreen();
                    }
                  })),
        ));
  }
}
