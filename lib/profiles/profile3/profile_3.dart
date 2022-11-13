import 'package:flutter/material.dart';
import 'package:marathon_ui/profiles/profile3/user.dart';
import 'provider.dart';

class Profile3 extends StatefulWidget {
  const Profile3({Key? key}) : super(key: key);

  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4a4a4a);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/profiles/dr.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              _bodyContent(context),
              _profileImage(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.07,
      left: 16,
      right: 16,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListView(
          children: [
            Text(
              _profile.user.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: _textColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Text(
                _profile.user.addres,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _followButton(context),
            ),
            _divider(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _counters(context),
            ),
            _divider(context),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'PHOTOS (${_profile.photos.toString()})',
                style: TextStyle(
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _photos(context),
            ..._aboutMe(context),
            _friends(context),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 13,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  Widget _profileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.07 - 40,
      left: MediaQuery.of(context).size.width / 2 - 40,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/profiles/sm.jpg'),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: MaterialButton(
        color: Colors.orange[900],
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            'FOLLOW',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'FOLLOWERS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.followers.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'FOLLOWING',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.friends.toString(),
                style: _bottomBarCounter,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _photos(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24),
      height: 120,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(_profile.photos, (index) {
            return Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/profiles/bb.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            );
          })),
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 24, top: 22, bottom: 6),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
            color: _textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          _profile.user.about,
          style: TextStyle(
            color: _textColor,
            fontSize: 13,
            height: 1.2,
            letterSpacing: 1,
          ),
        ),
      )
    ];
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, bottom: 8),
      child: Text(
        "FRIENDS (${_profile.friends})",
        style: TextStyle(
          color: _textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.only(left: 24),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          25,
          (index) {
            return Container(
              width: 75,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/profiles/yl.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
