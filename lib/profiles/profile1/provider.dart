import 'package:marathon_ui/profiles/profile1/user.dart';

class Profile1Provider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: 'Sawsen Ait Ahmed',
          addres: 'Boumerdes, Algeria',
          about:
              'I am an engineer in Information Technology (I. T) and Full stack Developer. I learned to code from an early age in various computer languages I master the different technical stages of the creation of systems and mobile applications based on the Flutter framework. '),
      followers: 2318,
      following: 1458,
      friends: 592,
    );
  }
}
