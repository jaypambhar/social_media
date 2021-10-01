import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:social_media_app/commen_tools/bottombar_page.dart';
import 'package:social_media_app/login_screen/register.dart';
import 'package:social_media_app/screens/commential.dart';
import 'package:social_media_app/screens/favorite_page.dart';
import 'package:social_media_app/screens/home_page.dart';
import 'package:social_media_app/screens/profile_page.dart';
import 'package:social_media_app/screens/search_page.dart';
import 'package:social_media_app/utils/route_config.dart';
import 'package:social_media_app/login_screen/login_page.dart';
import 'package:social_media_app/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xff0a0d17)),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.light),
      initialRoute: RoutePages.splash,
      routes: {
        RoutePages.splash: (context) => Splash(),
        RoutePages.loginPage: (context) => LoginPage(),
        RoutePages.register: (context) => Register(),
        RoutePages.bottombarPage: (context) => BottomBarPage(),
        RoutePages.homePage: (context) => HomePage(),
        RoutePages.searchPage: (context) => SearchPage(),
        RoutePages.favoritePage: (context) => FavoritePage(),
        RoutePages.profilePage: (context) => ProfilePage(),
        RoutePages.commentPage: (context) => CommentPage(),
      },
    );
  }
}
// class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   static bool switchtheme = true;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: switchtheme?ThemeData.dark():ThemeData.light(),
//       initialRoute: RoutePages.splash,
//       routes: {
//         RoutePages.splash: (context) => Splash(),
//         RoutePages.loginPage: (context) => LoginPage(),
//         RoutePages.register: (context) => Register(),
//         RoutePages.homePage: (context) => HomePage(),
//       },
//     );
//   }
// }
