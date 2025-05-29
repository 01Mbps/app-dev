class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    this.imageUrl,
    required this.author,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      text: json['text'] ?? '',
      id: json['id'] ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt'] ?? '')?.millisecondsSinceEpoch ??
              0,
      author: Author.fromJson(json['author']),
      imageUrl: json[
          'image'], // fallback to empty string if not present '', // fallback to empty string if not present
    );
  }
}

class Author {
  String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      username: json['name'] ?? '', // use 'name' instead of 'username'
    );
  }
}
