import 'package:marathon_ui/profiles/profile4/user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
      user: User(
        name: 'Sawsen Ait Ahmed',
        profession: 'Flutter developer',
        about:
            'I am an engineer in Information Technology (I. T) and Full stack Developer. ',
      ),
      followers: 2318,
      following: 1458,
      friends: 592,
    );
  }
}
