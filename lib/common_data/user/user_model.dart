class UserModel {
  String userName;
  String phone;
  String avatar;
  num age;

  UserModel();

  UserModel.create(
    String userName,
    String phone,
    String avatar,
    num age,
  ) {
    this.userName = userName;
    this.phone = phone;
    this.avatar = avatar;
    this.age = age;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userName = json['userName'];
    phone = json['phone'];
    avatar = json['avatar'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": this.userName,
      "phone": this.phone,
      "avatar": this.avatar,
      "age": this.age,
    };
  }
}
