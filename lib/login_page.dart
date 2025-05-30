//import 'package:chat_app/chat_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';  
//import 'package:chat_app/utils/textfield_styles.dart';
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
          print('Login failed');
        }
      }

    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    final _mainUrl = 'https://github.com/callmeEltonBernil/chat_app/commits/main/';

        @override
        Widget _buildHeader(context) {
          return Column(

            children: [
            Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                 fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),


              Text(
                'Welcome back! \n You\'ve been missed!',

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
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
                    borderRadius: BorderRadius.circular(24)),
              ),


            Widget _buildFooter() {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  print('Link clicked!');
                  if (!await launch(_mainUrl)) {
                    throw 'Could not launch this!';
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
                    size: 20, url: "https://twitter.com/pooja_bhaumik"),
                  SocialMediaButton.linkedin(
                   size: 20, url: "https://linkedin.com/in/poojab26")

                  
                ],

            )
            ],

          ),
        Widget _buildForm(context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length < 5) {
                          return "Your username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController, 
                      ),

                    verticalSpacing(24),
                    LoginTextField(
                      controller: passwordController,
                      hintText: 'Enter your password', 
                      hasAsterisk: true,
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
                   backgroundColor: Colors.deepPurple,
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Adjust the value for more or less roundness
                    ),
                   ),

                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: Colors.white,),
                  )),
                   );
        }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView( 
            child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1000) {
                // web layout
                return Row(     
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeader(context),
                          _buildFooter(),
                        ],
                      ),
                       
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(child: _buildForm(context)),
                    Spacer(
                      flex: 1,
                    ),
                  ],
               );
            }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter(),
                ],
              );
            }),
             ),
    );
  }
  }