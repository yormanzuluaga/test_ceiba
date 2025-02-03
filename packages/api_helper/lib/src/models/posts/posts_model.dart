class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  PostsModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostsModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
