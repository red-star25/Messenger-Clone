import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class Chat_Screen extends StatefulWidget {
  String userName, userImage, myImage;
  Chat_Screen({this.userImage, this.userName, this.myImage});
  @override
  _Chat_ScreenState createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 30,
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.call,
              color: Colors.blue,
              size: 25,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.videocam,
              color: Colors.blue,
              size: 25,
            ),
          ),
          SizedBox(
            width: 35,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.myImage),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                widget.userName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Bubble(
                  margin: BubbleEdges.only(top: 2),
                  nip: BubbleNip.no,
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'How are you?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(widget.myImage),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 2),
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.no,
                  color: Colors.grey[300],
                  child: Text(
                    'Im fine',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Bubble(
                  margin: BubbleEdges.only(top: 2),
                  nip: BubbleNip.no,
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Where are you?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(widget.myImage),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 2),
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.no,
                  color: Colors.grey[300],
                  child: Text(
                    'Im in India.\nWhere are you?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.category,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.mic,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                      ),
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Aa",
                              helperStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900,
                              ),
                              suffixIcon: Icon(
                                Icons.insert_emoticon,
                                color: Colors.blue,
                                size: 30,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
