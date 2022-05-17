import 'package:favcharacters/chars.dart';
import "package:flutter/material.dart";

import 'detailspage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Chars>> showChars() async {
    var charsList = <Chars>[];
    var c1 = Chars(
      1,
      "Tony Stark",
      "tonystark.jpeg",
    );
    var c2 = Chars(
      2,
      "Aragorn",
      "aragorn.png",
    );
    var c3 = Chars(
      3,
      "Jake Peralta",
      "jakeperalta.jpeg",
    );
    var c4 = Chars(
      4,
      "Hermione Granger",
      "hermionegranger.jpeg",
    );
    var c5 = Chars(
      5,
      "Bucky Barnes",
      "buckybarnes.jpeg",
    );

    charsList.add(c1);
    charsList.add(c2);
    charsList.add(c3);
    charsList.add(c4);
    charsList.add(c5);

    return charsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black45,
          backgroundColor: Colors.transparent,
          title: const Text("My Favorite Characters of All Time")),
      body: FutureBuilder<List<Chars>>(
        future: showChars(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var charsList = snapshot.data;

            return GridView.builder(
              itemCount: charsList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                var char = charsList[index];

                return GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(char: char,),),);},
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${char.char_pic_name}"),
                        ),
                        Text(
                          char.char_name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
