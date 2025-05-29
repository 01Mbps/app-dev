import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Inialize the list of messages
  List<ChatMessageEntity> _messages = [];
  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final List<dynamic> decodeList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    print(_chatMessages.length);

    //Finally, add the messages to the list
    setState(() {
      _messages = _chatMessages;
    });
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadInitialMessages();
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $userName!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              print('Icon Pressed');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    alignment:
                        _messages[index].author.username == 'Elton Bernil'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    entity: _messages[index],
                  );
                }),
          ),
          const ChatInput(), // Add ChatInput at the bottom
        ],
      ),
    );
  }
}
