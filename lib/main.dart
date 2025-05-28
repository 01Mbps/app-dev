import 'package:flutter/material.dart';

void main() {
  runApp(Chatapp());
}

class Chatapp extends StatelessWidget {
  const Chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat App",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Loginpage(),
    );
  }
}

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print('Button Clicked');
        },
      ),
      body: Text('Patweak'),
    );
  }
}
