class User {
  String name, profession, about;
  User({required this.name, required this.profession, required this.about});
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
