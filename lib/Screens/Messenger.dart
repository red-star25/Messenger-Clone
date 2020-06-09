import 'dart:convert';

import 'package:flutter/material.dart';
import './People_Screen.dart';
import 'Chat_Screen.dart';

class Messenger_Home extends StatefulWidget {
  Messenger_Home({Key key}) : super(key: key);

  @override
  _Messenger_HomeState createState() => _Messenger_HomeState();
}

class _Messenger_HomeState extends State<Messenger_Home> {
  String userImage="https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 25,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.edit,
              color: Colors.black,
              size: 25,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  userImage),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Chats",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 26),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            textField(),
            SizedBox(
              height: 15,
            ),
            storyBar(),
            SizedBox(
              height: 15,
            ),
            chatListTile(userImage),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget textField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        leading: Icon(
          Icons.search,
          color: Colors.grey[600],
          size: 25,
        ),
        title: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget storyBar() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ),
                backgroundColor: Colors.grey[300],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your Story",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              )
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        SizedBox(
            width: 300,
            height: 81,
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("json_data/user.json"),
              builder: (context, snapshot) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: snapshot.data == null ? 0 : 5,
                  itemBuilder: (context, index) {
                    var storyData = jsonDecode(snapshot.data.toString());
                    return Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: CircleAvatar(
                            radius: 26,
                            backgroundImage:
                                NetworkImage(storyData[index]["userImage"]),
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          storyData[index]["userName"],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  },
                );
              },
            ))
      ],
    );
  }

  Widget chatListTile(String userImage) {
    return SizedBox(
      height: 436,
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("json_data/user.json"),
        builder: (context, snapshot) {
          var userData = jsonDecode(snapshot.data.toString());
          return ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chat_Screen(
                        userImage: userData[index]["userImage"],
                        userName: userData[index]["userName"],
                        myImage:userImage
                      ),
                    ),
                  );
                },
                child: ListTile(
                    title: Text(
                      userData[index]["userName"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(userData[index]["userImage"]),
                        child: userData[index]["online"]
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.green[500],
                                ),
                              )
                            : SizedBox()),
                    subtitle: Row(
                      children: <Widget>[
                        Text(
                          userData[index]["subString"],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: userData[index]["unread"]
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          userData[index]["time"],
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: userData[index]["unread"]
                        ? CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 8,
                          )
                        : SizedBox()),
              );
            },
          );
        },
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        currentIndex: 0,
        onTap: (value) {
          if (value == 0) {
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => People_Screen()));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
            ),
            title: Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            title: Text(
              "People",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ]);
  }
}
