class ChatMessageEntity {
  String text;
  String imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.imageUrl,
    required this.id,
    required this.createdAt,
    required this.author,
  });
}

class Author {
  String username;

  Author({
    required this.username,
  });
}
