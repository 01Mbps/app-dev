import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('Username: ${userNameController.text}');
      print('Password: ${passwordController.text}');

      Navigator.push(
        context,
        MaterialPageRoute(
         builder: (context) => ChatPage(
          userName: userNameController.text,
          )));

      print('Login successful');
    } else {
      print('Login failed');
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
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


            Form(
              key: _formKey,
              child: Column(

                children: [
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length < 5) {
                        return 'Your username must be at least 5 characters long';
                      } else if (value != null && value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },

                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'Add your username',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(
                    height: 24
                    ),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Type your Password',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(
              height: 24
            ),

            ElevatedButton(
              onPressed: (){ 
                loginUser(context);
              },

              child: Text(
                'Login', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              ),
            ),


            GestureDetector(
              onDoubleTap: () {
                print('Double Tapped');
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