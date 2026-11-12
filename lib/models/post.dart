class Post {
  // final : nilainya tidak bisa diubah setelah objek dibuat.
  final int userId; 
  final int id;
  final String title;
  final String body;

  const Post({
    // required : parameter wajib diisi saat membuat objek.
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // factory Post.fromJson(...) : cara khusus membuat Post
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}