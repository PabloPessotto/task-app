class User {
  int? userId;
  String? name;
  String? token;

  User({this.userId, this.name, this.token});

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "token": token,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      name: json["name"],
      token: json["token"],
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, name: $name, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;
}
