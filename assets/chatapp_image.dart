import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

final _formKey = GlobalKey<FormState>();

  // Function to handle login
void loginUser(context) {

  if (_formKey.currentState != null && _formKey.currentState!.validate()) {

    print(userNameController.text);
    print(passwordController.text);

    Navigator.pushReplacementNamed(
      context,
      '/chat',
      arguments: userNameController.text,
    );
    print('Login successful');

  } else {
    print('Login failed');
  }
}
final userNameController = TextEditingController();
final passwordController = TextEditingController();


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
              Image.asset(
                'assets/chat_app_image.png',
                height: 200,
              ),


            Form(
              key: _formKey,
              child: Column(

                children: [
                  LoginTextField(
                    hintText: 'Enter your username',
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length < 5) {
                        return 'Your username must be at least 5 characters long';
                      } else if (value != null && value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },

                    controller: userNameController,

                  ),

                 verticalSpacing(24),

                  LoginTextField(
                    hashAsterisk: true,
                    controller: passwordController, hintText: 'Enter your password',

                  ),
                ],
              ),
            ),

             verticalSpacing(24),

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
                print('Linked Clicked');
              },


              child: Column(
                children: [
                  Text('Find us on'),
                  Text('https://eltonprojects.com'),
                ],
              ),
            ),
            ],

          ),
        ),
      ),
    );
  }