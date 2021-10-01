// import 'package:flutter/material.dart';

// import 'package:social_media_app/screens/favorite_page.dart';
// import 'package:social_media_app/screens/home_page.dart';
// import 'package:social_media_app/screens/profile_page.dart';
// import 'package:social_media_app/screens/search_page.dart';

// class BottomBarPage extends StatefulWidget {
//   const BottomBarPage({Key key}) : super(key: key);

//   @override
//   _BottomBarPageState createState() => _BottomBarPageState();
// }

// class _BottomBarPageState extends State<BottomBarPage> {
//   int currentIndex = 0;

//   List<Widget> currentPage = [
//     HomePage(),
//     SearchPage(),
//     FavoritePage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentPage[currentIndex],
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(
//           left: 30,
//         ),
//         child: Container(
//           width: double.infinity,
//           height: 60,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: FractionalOffset.topCenter,
//               end: FractionalOffset.bottomCenter,
//               colors: [
//                 Color(0xff5C3A77),
//                 Color(0xff3A2D60),
//                 Color(0xff18214A),
//               ],
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(30),
//             ),
//             // color: Colors.black87,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: currentIndex == 0
//                     ? Icon(Icons.home_outlined)
//                     : Icon(Icons.home),
//                 onTap: () => setState(() => currentIndex = 0),
//               ),
//               InkWell(
//                 child: currentIndex == 1
//                     ? Icon(Icons.search_rounded)
//                     : Icon(Icons.search),
//                 onTap: () => setState(() => currentIndex = 1),
//               ),
//               InkWell(
//                 child: currentIndex == 2
//                     ? Icon(Icons.favorite)
//                     : Icon(Icons.favorite_outline),
//                 onTap: () => setState(() => currentIndex = 2),
//               ),
//               InkWell(
//                 child: currentIndex == 3
//                     ? Icon(Icons.person_outline)
//                     : Icon(Icons.person),
//                 onTap: () => setState(() => currentIndex = 3),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:social_media_app/screens/favorite_page.dart';
import 'package:social_media_app/screens/home_page.dart';
import 'package:social_media_app/screens/profile_page.dart';
import 'package:social_media_app/screens/search_page.dart';

class BottomBarPage extends StatefulWidget {
  BottomBarPage({Key key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  Color currentColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _commonWidget()),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              buildMenuItems(text: "Home", icon: Icons.home, index: 0),
              buildMenuItems(text: "Chat", icon: Icons.chat, index: 1),
              SizedBox(width: 10),
              buildMenuItems(text: "Favorite", icon: Icons.favorite, index: 2),
              buildMenuItems(text: "Profile", icon: Icons.person, index: 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  buildMenuItems({text, icon, color, index}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Icon(
                icon,
                color: currentIndex == index ? currentColor : Colors.grey,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  Widget _commonWidget() {
    print(currentIndex);
    switch (currentIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return SearchPage();
        break;
      case 2:
        return FavoritePage();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
    }
  }
}
