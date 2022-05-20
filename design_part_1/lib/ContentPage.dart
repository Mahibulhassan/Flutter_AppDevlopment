import 'package:design_part_1/main.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
    title: Text(
      "Content Page",
      style: TextStyle(color: Colors.black),
    ),
      ),
      body: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: size.width * .45,
              child: button("Container Widget", context)),
          SizedBox(
            width: size.width * .01,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: size.width * .45,
              child: button("Row And Collum", context))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: size.width * .45,
              child: button("Basic List View", context)),
          SizedBox(
            width: size.width * .01,
          ),
          Container(
              width: size.width * .45,
              child: button("LIst Widget", context))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: size.width * .45, child: button("Stack ", context)),
          SizedBox(
            width: size.width * .01,
          ),
          Container(
              width: size.width * .45, child: button("GridView", context))
        ],
      ),
    ],
      ),
    );
  }
}

Widget button(String btn_name, BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        pageRote(btn_name, context);
      },
      child: Text(
        btn_name,
        style: TextStyle(color: Colors.black, fontSize: 30),
      ));
}

void pageRote(String btn_name, BuildContext context) {
  switch (btn_name) {
    case "Container Widget":
      {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
        break;
      }
    case "Row And Collum":
      {
        break;
      }

    case "Basic List View":
      {
        break;
      }

    case "LIst Widget":
      {
        break;
      }

    case "Stack ":
      {
        break;
      }

    case "GridView":
      {
        break;
      }
  }
}
