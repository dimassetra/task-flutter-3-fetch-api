class User {
  final int id;
  final String title;
  final String body;

  const User({
    required this.id,
    required this.title,
    required this.body,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
