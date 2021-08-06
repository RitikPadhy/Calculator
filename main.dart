import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR")
    {
      _output= "0";
      n1 = 0.0;
      n2 = 0.0;
      operand= "";
    }
    else if(buttonText == "+"|| buttonText == "-" || buttonText == "/" || buttonText == "X")
    {
      n1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if(buttonText == ".")
    {
      if(output.contains("."))
      {
        print("Already exists a decimal");
      }
      else
      {
        _output= _output + buttonText;
      }
    }
    else if(buttonText == "=")
    {
      n2 = double.parse(output);
      if(operand == "+")
      {
        _output = (n1 + n2).toString();
      }
      if(operand == "-")
      {
        _output = (n1 - n2).toString();
      }
      if(operand == "X")
      {
        _output = (n1 * n2).toString();
      }
      if(operand == "/")
      {
        _output = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    }
    else
    {
      _output = _output + buttonText;
    }
    print(_output);


    setState()
    {
      output= double.parse(_output).toStringAsFixed(2);
    }
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
        child: new OutlineButton(
          padding: new EdgeInsets.all(24.0),
          child: new Text(buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () =>
              buttonPressed(buttonText)
          ,
        )
    );
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("Calculator"),
        ),
        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(output,style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    )

                    )
                ),

                new Expanded(
                  child: new Divider(),
                ),
                new Column(children: [

                  new Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("6"),
                      buildButton("5"),
                      buildButton("4"),
                      buildButton("X"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("3"),
                      buildButton("2"),
                      buildButton("1"),
                      buildButton("-")
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+")
                    ],
                  ),
                  new Row(
                      children: [
                        buildButton("CLEAR"),
                        buildButton("="),
                      ]
                  )

                ],)

              ],)
        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}