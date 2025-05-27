import 'package:flutter/material.dart';

void main() {
  runApp(Chatapp());
}

class Chatapp extends StatelessWidget {
  const Chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Chat App",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Button Clicked');
          },
        ),
        body: Text('Patweak'),
      ),
    );
  }
}
