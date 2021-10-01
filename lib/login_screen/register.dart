import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/repository/api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/utils/route_config.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _visible = true;
  bool isLoading = false;
  List errors = [];

  String name = '';
  String email = '';
  String password = '';

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
                    top: 30,
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
                        hintText: "Name",
                        hintStyle: TextStyle(letterSpacing: 4),
                        labelText: "Name",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.person_outline),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Valid Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(letterSpacing: 4),
                        labelText: "Email",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.lock_outline),
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
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: _visible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(letterSpacing: 4),
                        labelText: "Password",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.person_outline),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10)),
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
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Valid Password";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            registerFun();
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
                              "register".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.center),
                      ),
                    ),
                    // SizedBox(height: 20),
                    Column(
                      children: errors.map((e) => Text(" $e")).toList(),
                    ),
                    SizedBox(height: 70),

                    Text("Don't have an account ?")
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void registerFun() async {
    http.Response res = await AuthRepository.registerApi(
        name: name, email: email, password: password);
    if (res != null) {
      print(res.statusCode);
      if (res.statusCode < 250) {
        var response = jsonDecode(res.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("TOKEN", response['data']['token']);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              content: Text("${response['message']}"),
            ))
            .closed
            .then((value) =>
                Navigator.of(context).pushNamed(RoutePages.bottombarPage));

        print(res.body);
      } else if (res.statusCode == 400) {
        var data = jsonDecode(res.body);
        setState(() {
          errors = data['data']['error'];
        });
      }
    }
  }


  
}

// Widget myBullet() {
  //   return Container(
  //     height: 10,
  //     width: 10,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: Colors.black,
  //     ),
  //   );
  // }


  // void registerFun() async {
  //   http.Response res = await AuthRepository.registerApi(
  //       name: name, email: email, password: password);
  //   if (res != null) {
  //     print(res.statusCode);
  //     if (res.statusCode == 200) {
  //       var response = jsonDecode(res.body);
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString("TOKEN", response['data']['token']);
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(
  //             SnackBar(
  //               duration: const Duration(milliseconds: 200),
  //               content: Text("${response["message"]}"),
  //             ),
  //           )
  //           .closed
  //           .then((SnackBarClosedReason reason) =>
  //               Navigator.pushNamed(context, RoutePages.homePage));
  //     }
  //     print(res.body);
  //   } else if (res.statusCode == 400) {
  //     var data = jsonDecode(res.body);
  //     setState(() {
  //       errors = data["data"]["error"];
  //     });
  //   }
  // }