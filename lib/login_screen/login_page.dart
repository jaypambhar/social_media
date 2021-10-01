import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/utils/route_config.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["Email"]);

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  GoogleSignInAccount _currentUser;
  bool _visible = true;
  List<String> arrays = [];
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      // setPrefs();
      if (_currentUser != null) {
        print("$_currentUser");
      }
    });
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() {
    return _googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.white.withOpacity(0.2),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/login_bg.jpg",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    bottom: 60,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "ILITE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _loginDetails(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginDetails() => Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "emailaddress",
                        labelText: "Email",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.person_outline),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: _visible,
                      decoration: InputDecoration(
                        hintText: "password",
                        labelText: "Password",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.lock_outline),
                          onPressed: () {},
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_visible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _visible = !_visible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Valid Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, RoutePages.homePage);
                          }
                        },
                        child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Colors.lightBlue,
                                Colors.blueAccent
                              ]),
                            ),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.center),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _handleSignIn(),
                            child: Image.asset("assets/images/google.png"),
                          ),
                          Text(
                            'Sign In With google',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutePages.register);
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );



  void setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("IS_LOGGED_IN", true);
    // Navigator.pushNamed(context, RoutePages.register);
  }
}
