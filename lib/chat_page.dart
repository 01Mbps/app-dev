import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChatPage extends StatefulWidget {
   ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Inialize the list of messages
   List<ChatMessageEntity> _messages = [];


  _loadInitialMessages() async{
    rootBundle.loadString('assets/mock_messages.json').then((response) {

    final List <dynamic> decodeList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }). toList();

    print(_chatMessages.length);

    //Finally, add the messages to the list
    setState(() {
      _messages = _chatMessages;

        });
    }).then((_) {
      print('Done loading messages');
    });

    print('Someething');
  }

  onMessageSent(ChatMessageEntity entity) {
      _messages.add(entity);
      setState(() {});
  }



  @override
  void initState() {
    _loadInitialMessages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


       final username = context.watch<AuthService>().getUserName();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
       title: Text('Hii $username!'),,
        actions: [
           IconButton(
              onPressed: () {
                context.read<AuthService>().updateUserName("New Name!");
              },
              icon: Icon(Icons.change_circle)),
        ],
      ),

      body: Column(
        children: [

          Expanded(


            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {

              return ChatBubble(

                alignment: _messages[index].author.username ==
                            context.read<AuthService>().getUserName()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,

                entity: _messages[index],);
            })),

        ChatInput(
          onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }