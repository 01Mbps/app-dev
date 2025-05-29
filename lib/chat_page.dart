import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      author: Author(username: 'Elton Bernil'),
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: '1',
      text: 'First Text',
      imageUrl: '', // Provide a valid image URL or leave empty
    ),
    ChatMessageEntity(
      author: Author(username: 'Elton Bernil'),
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: '2',
      text: 'Second Text',
      imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
    ),
    ChatMessageEntity(
      author: Author(username: 'Elli'),
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: '3',
      text: 'Third Text',
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
