import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button Clicked');
        },
      ),
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrange,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'Welcome Back Patweak!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
          Image.network('https://w.wallhaven.cc/full/9o/wallhaven-9oxjj8.jpg'),
          Container(
            height: 150,
            width: 150,
            child: FlutterLogo(),
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              image: DecorationImage( image: NetworkImage(url)

              )
            Colors.cyanAccent , 
            borderRadius: BorderRadius.circular(24)),
          )
        ],
      ),
    );
  }
}

mixin fontWeight {
  var bold;
}
