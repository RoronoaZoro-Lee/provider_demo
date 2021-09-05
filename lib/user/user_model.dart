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

  @override
  String toString() {
    return "userName: $userName, phone: $phone, avatar: $avatar, age: $age,";
  }
}
