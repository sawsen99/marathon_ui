import 'package:flutter/material.dart';
import 'package:marathon_ui/profiles/profile5/user.dart';

class Profile5 extends StatefulWidget {
  const Profile5({Key? key}) : super(key: key);

  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  Profile _profile = ProfileProvider.profile();
  static Color _textColor = Color(0xFF4a4a4a);
  bool _visible = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: _textColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: _textColor,
            ),
          )
        ],
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileDetails(context),
          Flexible(child: _tabBarContent(context)),
        ],
      ),
    );
  }

  Widget _profileDetails(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24),
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/profiles/yy.jpg'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _profile.user.name,
              style: TextStyle(
                color: _textColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              _profile.user.profession,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 17,
              ),
            ),
          ),
          _followButton(context),
        ],
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: MaterialButton(
        elevation: 0,
        color: Colors.orange[900],
        onPressed: () {},
        child: AnimatedPadding(
          duration: Duration(milliseconds: 400),
          padding:
              EdgeInsets.symmetric(horizontal: _visible ? 16 : 2, vertical: 8),
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

  Widget _tabBarContent(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300),
          )),
          child: TabBar(
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: _textColor,
            indicatorColor: _textColor,
            controller: _tabController,
            indicatorWeight: 4,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            tabs: const [
              Tab(
                text: 'PHOTOS',
              ),
              Tab(text: 'VIDEOS'),
              Tab(text: 'POSTS'),
              Tab(text: 'FRIENDS')
            ],
          ),
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: [
              _photos(context),
              _videos(context),
              _posts(context),
              _friends(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _photos(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          crossAxisCount: 3,
          children: ProfileProvider.photos().map((photo) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(photo),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            );
          }).toList(),
        ));
  }

  Widget _videos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: GridView.count(
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        crossAxisCount: 3,
        children: ProfileProvider.videos().map((photo) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(photo),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _posts(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: GridView.count(
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        crossAxisCount: 3,
        children: ProfileProvider.posts().map((photo) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(photo),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _friends(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: GridView.count(
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        crossAxisCount: 3,
        children: ProfileProvider.friends().map((photo) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(photo),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
