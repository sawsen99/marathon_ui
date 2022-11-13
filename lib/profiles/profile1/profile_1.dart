import 'package:flutter/material.dart';
import 'package:marathon_ui/profiles/profile1/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'provider.dart';

class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = Profile1Provider.getProfile();
  static Color _textColor = Color(0xFF4a4a4a);
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
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
          Image.asset(
            'assets/profiles/vl.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "PROFILE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              centerTitle: true,
              leading: InkWell(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.bars),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.cog)),
              ],
            ),
            body: Stack(
              children: [
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.22,
                  child: CircleAvatar(
                    minRadius: 38,
                    backgroundImage: ExactAssetImage('assets/profiles/yy.jpg'),
                  ),
                ),
                _bodyText(context),
                _bottomBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      //bottom: 0,
      right: 24,
      left: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              profile.user.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: _textColor,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey.shade400,
              ),
              Text(
                profile.user.addres,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 9),
            child: Text(
              'ABOUT ME',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              profile.user.about,
              softWrap: true,
              style: TextStyle(
                color: _textColor,
                fontSize: 13,
                height: 1.2,
                // letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 4,
      left: 23,
      right: 23,
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
                height: 4,
              ),
              Text(
                profile.followers.toString(),
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
                height: 4,
              ),
              Text(
                profile.following.toString(),
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
                height: 4,
              ),
              Text(
                profile.friends.toString(),
                style: _bottomBarCounter,
              ),
            ],
          )
        ],
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
    fontWeight: FontWeight.bold,
  );
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.38);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
