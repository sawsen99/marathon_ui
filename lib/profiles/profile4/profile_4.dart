import 'package:flutter/material.dart';
import 'package:marathon_ui/profiles/profile4/user.dart';
import 'provider.dart';

class Profile4 extends StatefulWidget {
  const Profile4({Key? key}) : super(key: key);

  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile _profile = ProfileProvider.getProfile();
  bool _visible = false;
  static Color _textColor = Color(0xFF4a4a4a);

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
    return Stack(
      children: [
        Image.asset(
          'assets/profiles/pr5.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                icon: Icon(Icons.more_vert),
              )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: Duration(milliseconds: 700),
                child: _bodyCard(context)),
          ),
        )
      ],
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 12,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  Widget _bodyCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.47,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _profileRow(context),
          ..._profileText(context),
          Spacer(flex: 2),
          _divider(context),
          _counters(context),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
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
                height: 5,
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
                height: 5,
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
                height: 5,
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

  _profileRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/profiles/yy.jpg'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Spacer(flex: 2),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'ADD FRIENDS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  side: BorderSide(color: _textColor, width: 1),
                )),
          ),
          SizedBox(width: 13),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'FOLLOW',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: _textColor,
                elevation: 0,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )),
          )
        ],
      ),
    );
  }

  List<Widget> _profileText(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 5),
        child: Text(
          _profile.user.name,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: _textColor,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 8),
        child: Text(
          _profile.user.profession,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          _profile.user.about,
          style: TextStyle(
            color: _textColor,
            fontSize: 13,
            letterSpacing: 1,
          ),
        ),
      ),
    ];
  }
}
