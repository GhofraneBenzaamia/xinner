class UserModel {
  late String? userId, email, username, phoneNumber, pic;

  late String? role;
  UserModel({
    required this.userId,
    required this.email,
    required this.pic,
    required this.username,
    required this.phoneNumber,
    required this.role,
  });
  void setUser(UserModel user) {
    userId = user.userId;
    email = user.email;
    username = user.username;
    phoneNumber = user.phoneNumber;
    pic = user.pic;
    role = user.role;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setUserId(String id) {
    userId = id;
  }

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['uid'];
    email = map['email'];
    username = map['name'];
    phoneNumber = map['phoneNumber'];
    pic = map['profilePicture'];
    role = map['role'];
  }

  toJson() {
    return {
      'id': userId,
      'email': email,
      'name': username,
      'phoneNumber': phoneNumber,
      'profilePicture': pic,
      'role': role
    };
  }

  @override
  String toString() {
    return "userId : $userId\nusername : $username\nemail : $email";
  }
}
