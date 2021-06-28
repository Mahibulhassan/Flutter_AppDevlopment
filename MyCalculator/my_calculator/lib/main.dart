import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String eqution ="0";
  String result ="0";
  String expression ="";
  double eqution_fontSize =38.0;
  double result_fontSize =48.0;

  buttonPressed(String button_text){
    setState(() {
      if(button_text == "c"){
        eqution ="0";
        result = "0";
         eqution_fontSize =38.0;
         result_fontSize =48.0;
      }else if(button_text=="⇽"){
        eqution_fontSize =48.0;
        result_fontSize =38.0;
        eqution = eqution.substring(0,eqution.length - 1);
        if(eqution == ""){
          eqution ="0";
        }
      }else if(button_text == "="){
        eqution_fontSize =38.0;
        result_fontSize =48.0;
        expression = eqution;
        expression = expression.replaceAll('÷', '/');
        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }else{
        eqution_fontSize =48.0;
        result_fontSize =38.0;
        if(eqution == "0"){
          eqution = button_text;
        }else{
          eqution = eqution + button_text;
        }
      }
    });
  }


  Widget buildButton(
      String button_text, double button_height, Color button_colour) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * button_height,
      color: button_colour,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            )),
        onPressed: ()=> buttonPressed(button_text),
        padding: EdgeInsets.all(16.0),
        child: Text(
          button_text,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              eqution,
              style: TextStyle(fontSize: eqution_fontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: result_fontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("c", 1.0, Colors.redAccent),
                          buildButton("⇽", 1.0, Colors.blue),
                          buildButton("÷", 1.0, Colors.blue),
                        ]),
                    TableRow(
                        children: [
                          buildButton("7", 1.0, Colors.black54),
                          buildButton("8", 1.0, Colors.black54),
                          buildButton("9", 1.0, Colors.black54),
                        ]),
                    TableRow(
                        children: [
                          buildButton("4", 1.0, Colors.black54),
                          buildButton("5", 1.0, Colors.black54),
                          buildButton("6", 1.0, Colors.black54),
                        ]),
                    TableRow(
                        children: [
                          buildButton("1", 1.0, Colors.black54),
                          buildButton("2", 1.0, Colors.black54),
                          buildButton("3", 1.0, Colors.black54),
                        ]),
                    TableRow(
                        children: [
                          buildButton(".", 1.0, Colors.black54),
                          buildButton("0", 1.0, Colors.black54),
                          buildButton("00", 1.0, Colors.black54),
                        ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("*", 1.0, Colors.blue),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-", 1.0, Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+", 1.0, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 2.0, Colors.redAccent),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
