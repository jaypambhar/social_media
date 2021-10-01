import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_media_app/utils/route_config.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   height: 190,
          //   child: StreamBuilder(
          //     stream: FirebaseFirestore.instance
          //         .collection("view profile")
          //         .snapshots(),
          //     builder: (context, snapshots) {
          //       if (!snapshots.hasData) return Text("Loading...");
          //       return Container(child: _profiles(document));
          //     },
          //   ),
          // ),
          _profiles(),
          followUsersDetails(),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemBuilder: (context, index) {
                return _profilePost();
              },
              staggeredTileBuilder: (int index) {
                print("$index");
                return StaggeredTile.count(2, index == 0 ? 2 : 1);
              },
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profiles() {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: NetworkImage(
                      "http://www.goodmorningimagesdownload.com/wp-content/uploads/2019/12/Love-Images-1.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white70,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePages.bottombarPage);
              },
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white70,
              ),
              onPressed: () {
                openBottomSheet();
              },
            ),
          ),
          Positioned(
            left: 130,
            bottom: -40,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.green,width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://thumbs.dreamstime.com/b/sorry-girls-man-taken-happy-couple-yellow-background-couple-love-sensual-couple-hug-casual-wear-couple-sorry-girls-173531188.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget followUsersDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [Text("23.4k"), Text("Followers")],
                ),
                Column(
                  children: [Text("434"), Text("Following")],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Jay Pambhar',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              "I beliave that to be distinctive,inspiring and/ninnovative@Behance",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Post",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profilePost() {
    return Container(
      height: 80,
      margin: EdgeInsets.only(left: 6, right: 5),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Image.asset(
        'assets/images/1.png',
        fit: BoxFit.cover,
      ),
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              ListTile(
                title: Text("Setting"),
              ),
              ListTile(
                title: Text("Logout"),
              ),
              ListTile(
                title: Text("Save"),
              )
            ],
          );
        });
  }
}
