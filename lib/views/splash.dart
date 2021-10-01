import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/utils/route_config.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    getprefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void getprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("TOKEN"));
    if (prefs.getString('TOKEN') != null) {
      Navigator.of(context).pushNamed(RoutePages.bottombarPage);
    } else {
      Navigator.of(context).pushNamed(RoutePages.register);
    }
  }
}
 // void getPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('TOKEN'));
  //   if (prefs.getString('TOKEN') != null) {
  //     Navigator.of(context).pushNamed(RoutePages.homePage);
  //   } else {
  //     Navigator.of(context).pushNamed(RoutePages.loginPage);
  //   }
  // }

// class Splash extends StatefulWidget {
//   Splash({Key key}) : super(key: key);

//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> with TickerProviderStateMixin {
//   AnimationController animationController;
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(duration: Duration(seconds: 2), vsync: this);
//     animationController.repeat();
//     getprefs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(
//           valueColor: animationController.drive(
//             ColorTween(begin: Colors.blueAccent, end: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }

 