import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

void loginUser() {
    print('Login successful');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),


              const Text(
                'Welcome back!\nYou\'ve been missed!',

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),

              Image.network(
                'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                height: 200,
              ),

            ElevatedButton(
              onPressed: loginUser, 

              child: Text(
              'Click Me' , 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              )),
                InkWell(
              splashColor: Colors.red,
              onDoubleTap: () {
                print('Double Tapped');
              },

              onLongPress: () {
                print('Long Pressed');
              },

              onTap: () {

                print('Linked Clicked');
              },
              child: Column(
                children: [
                  Text('Find us on'),
                  Text('https://patrickCr8s.com'),
                ],
              ),
            ),
            ],

          ),
          ),
      ),
    );
  }