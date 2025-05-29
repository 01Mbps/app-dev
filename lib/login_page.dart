import 'package:chat_app/chat_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';  
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Utils/spaces.dart';
import 'Widgets/login_text_field.dart';


class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

final _formKey = GlobalKey<FormState>();

  // Function to handle login
Future<void> loginUser(BuildContext context) async {
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {

    print(userNameController.text);
    print(passwordController.text);
      await context.read<AuthService>().loginUser(userNameController.text);
        Navigator.pushReplacementNamed(
      context,
      '/chat',
      arguments: userNameController.text,
    );
    print('Login successful');

  } else {
@@ -39,115 +40,132 @@
  @override
  Widget build(BuildContext context) {
    return Scaffold(


       backgroundColor: Colors.white,
      body: Center(
        child: Padding(
           padding: const EdgeInsets.all(24.0),
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

              verticalSpacing(24),
                Container(
                height: 200,
                 width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/chat_app_image.png')),
                borderRadius: BorderRadius.circular(56)),
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
               onPressed: () async {
                      await loginUser(context);
              },

              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple, // Set background color
            ),

              child: Text(
                'Login', 
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),


            GestureDetector(
              onTap: () async {
                print('Link clicked');
                if (!await launch(_mainUrl)) {
                  throw Exception('Could not launch this URL');
                 }
                },



              child: Column(
                children: [
                  Text('Find us on'),
                  Text(_mainUrl),
                ],
              ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SocialMediaButton.twitter(
                    size: 20,
                    color: Colors.blue,
                      url: 'https://twitter.com/Patrick',),

                  SocialMediaButton.linkedin(
                    url: 'https://linkedin.com/Patrick',)

                  
                ],

            )
            ],

          ),
        ),
      ),
    );
  }