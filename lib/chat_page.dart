import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;
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

  
   Future<List<PixelfordImage>>
   _getNetworkImages() async {
    var endpointUrl = Uri.parse('https://picsum.photos/v2/list');

    final response = await http.get(endpointUrl);
@@ -60,6 +61,9 @@
        return PixelfordImage.fromJson(listItem);
      }).toList();
      print(_imageList[0].urlFullSize);
      return _imageList;
    } else {
      throw Exception('API not successful!');
    }
  }

@@ -98,26 +102,34 @@

      body: Column(
        children: [
          FutureBuilder<List<PixelfordImage>>(
              future: _getNetworkImages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PixelfordImage>> snapshot) {
                if (snapshot.hasData)
                  return Image.network(snapshot.data![0].urlSmallSize);
                return CircularProgressIndicator();
              }),
          Expanded(


            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {

              return ChatBubble(

                alignment: _messages[index].author.username == 'Patrick'
                    ?Alignment.centerRight
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