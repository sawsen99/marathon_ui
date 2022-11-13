import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marathon_ui/profiles/profile2/user.dart';
import 'package:marathon_ui/profiles/profile2/provider.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  static Color _textColor = Color(0xFF4a4a4a);
  Profile _profile = ProfileProvider.getProfile();
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'SFDisplay'),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.46,
            width: double.infinity,
            child: Image.asset(
              'assets/profiles/nj.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.bars),
              ),
            ),
            body: Stack(
              children: [
                _profileTitle(context),
                _profileBody(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  Widget _profileTitle(BuildContext context) {
    return Positioned(
      top: 8,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: ExactAssetImage('assets/profiles/yy.jpg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              _profile.user.name,
              style: TextStyle(
                color: Color.fromARGB(255, 245, 231, 231),
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.4,
              ),
            ),
          ),
          Text(
            _profile.user.addres,
            style: TextStyle(
              color: Color.fromARGB(255, 245, 231, 231),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget _profileBody(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.33,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _counters(context),
            _divider(context),
            ..._aboutMe(context),
            //SizedBox(height: 3),
            _friends(context),
            //SizedBox(height: 13),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 12),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: _visible ? 1 : 0,
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
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, bottom: 6),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
            fontSize: 16,
            color: _textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          _profile.user.about,
          style: TextStyle(
            color: _textColor,
            fontSize: 13,
            height: 1.2,
            //letterSpacing: 1.2,
          ),
        ),
      )
    ];
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        bottom: 8,
      ),
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
      height: 60,
      padding: EdgeInsets.only(left: 12),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          25,
          (index) {
            return Container(
              width: 58,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/profiles/rd.jpg'),
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
