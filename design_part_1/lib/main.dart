import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.drag_handle,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.black,
            )
          ],
          title: Text(
            "Design Part 1",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Loyality Cards",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Menu",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      container(Colors.amberAccent, "Most Facorites",
                          "20 items", size),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      container(Colors.blue, "Newest", "20 Items", size),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      container(
                          Colors.blueAccent, "suffer void", "20 items", size),
                    ],
                  ),
                )),
            Container(
              height: size.height * 0.5,
              child: ListView.builder(
                  itemCount: 100,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      child: Text(
                        "Hi Mahibul",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget container(Color color, String data, String count, Size size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: color,
    ),
    height: size.height * 0.2,
    width: size.width * 0.3,
    child: Column(
      children: [
        Text(
          data,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        Text(
          count,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    ),
  );
}
