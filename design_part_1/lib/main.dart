import 'package:design_part_1/ContentPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContentPage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var prolist = ["Burger", "Chesse Dip", "Cola", "Fries"];
  var sublist = ["Hawkers", "Hawkers", "Mcdonaid", "Mcdonaid"];
  var priclist = ["\$-2.99", "\$-4.99", "\$-1.49", "\$-4.99"];
  var imageslist = [
    "assets/img1.jpeg",
    "assets/img2.jpeg",
    "assets/img3.jpeg",
    "assets/img4.jpeg"
  ];


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
            Expanded(
              child: ListView.builder(
                  itemCount: prolist.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        height: size.height * 0.1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  prolist[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.001,
                                ),
                                Text(
                                  sublist[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.001,
                                ),
                                Text(
                                  priclist[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: size.height * 0.05,
                                minRadius: size.height * 0.05,
                                backgroundImage: AssetImage(imageslist[index])),
                            //Image declear here
                          ],
                        ),
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
