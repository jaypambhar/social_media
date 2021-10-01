import 'package:flutter/material.dart';
import 'package:social_media_app/utils/route_config.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool liked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutePages.bottombarPage);
                  },
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      openBottomSheet();
                    },
                    icon: Icon(Icons.menu),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[350],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://amerisleep.com/blog/wp-content/uploads/2014/06/dream-hacking-understanding-behavior.jpg'),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.cyanAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Utpal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Ahmedabad',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                    ),
                  ],
                ),
                // SizedBox(height: 5),
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.pink,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://amerisleep.com/blog/wp-content/uploads/2014/06/dream-hacking-understanding-behavior.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CommentPage(),
                              //   ),
                              // );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.near_me_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 70),
                      Icon(Icons.expand_less),
                      Text(
                        'Previous',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 70),
                      Icon(Icons.keyboard_arrow_up),
                      Text(
                        'Oldest',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.stockvault.net/data/2011/02/21/117750/thumb16.jpg'),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.cyanAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'James Bond',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '2 Hour',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Life is like a box of chocolates; sometimes you just dig out the good center parts and leave all the undesirable rest to waste.',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 70, left: 5, top: 60),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    // margin: EdgeInsets.only(right: 100),
                    child: TextFormField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Comments",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
