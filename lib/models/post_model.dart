class Post {
  final String id;
  final String author;
  final String content;

  Post({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      author: map['author'],
      content: map['content'],
    );
  }
}
