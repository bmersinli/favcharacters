import 'package:favcharacters/chars.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  Chars char;

  DetailsPage({required this.char});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.char.char_name,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.char.char_pic_name}"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth / 3,
                  height: screenHeight / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text(
                      "Like",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      print("${widget.char.char_name} is Liked.");
                    },
                  ),
                ),
                SizedBox(
                  width: screenWidth / 3,
                  height: screenHeight / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text(
                      "Dislike",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      print("${widget.char.char_name} is Disliked.");
                    },
                  ),
                ),
              ],
            ),
            //Text("${widget.char.ch}"),
          ],
        ),
      ),
    );
  }
}
