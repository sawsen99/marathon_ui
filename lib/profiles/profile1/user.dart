class User {
  String name, addres, about;
  User({required this.name, required this.addres, required this.about});
}

class Profile {
  User user;
  int followers, following, friends;
  Profile(
      {required this.user,
      required this.followers,
      required this.following,
      required this.friends});
}
