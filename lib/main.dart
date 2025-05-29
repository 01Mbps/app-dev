import 'package:firstapp/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/chat_page.dart'; // Your main chat page
import 'package:chat_app/counter_stateful_demo.dart'; // Optional feature page
import 'package:chat_app/login_page.dart'; // Your actual login page

void main() {
  runApp(const ChatApp()); // Main entry point
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat App",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const ChatPage(), // Set your default landing screen here
    );
  }
}
