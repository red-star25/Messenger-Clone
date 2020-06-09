import 'package:flutter/material.dart';
import 'package:messenger/Screens/Messenger.dart';

class People_Screen extends StatefulWidget {
  People_Screen({Key key}) : super(key: key);

  @override
  _People_ScreenState createState() => _People_ScreenState();
}

class _People_ScreenState extends State<People_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) {
             Navigator.push(context,
                MaterialPageRoute(builder: (context) => Messenger_Home()));
          } 
          else {}
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
