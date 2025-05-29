 import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';




class ChatBubble extends StatelessWidget {

  final ChatMessageEntity entity;
  final Alignment alignment;


  const ChatBubble({
    Key? key,
    required this.alignment,
    required this.entity,
  }) : super(key: key);

  @override
@@ -20,24 +26,28 @@
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${entity.text}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            
            if (entity.imageUrl != null)
            Image.network(
              '${entity.imageUrl}',
              height: 200,
            ),
          ],
        ),

        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}