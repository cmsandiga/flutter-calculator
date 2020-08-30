import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Calculator",
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.black26),
      home: CalculatorHomePage(title: "Flutter Calculator"),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  final String title;

  CalculatorHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CalculatorHomePageState();
  }
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _str = "0";
  var _calculation = Calculation();

  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      _str = _calculation.getResult().toString();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              color: Colors.lightGreen[50],
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  _str,
                  textScaleFactor: 2.0,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 3,
                        child: FlatButton(
                          child:
                              Text("C", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            deleteAll();
                          },
                          color: Colors.black54,
                        )),
                    Expanded(
                        flex: 1,
                        child: FlatButton(
                          child:
                              Text("<-", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            deleteOne();
                          },
                          color: Colors.black87,
                        ))
                  ])),
          Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedRow(
                          crossAxisAlignment:  CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                              child: Text("7",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("7");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text("8",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("8");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text("9",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("9");
                              },
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment:  CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                child: Text("4",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("4");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("5",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("5");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                              child: Text("6",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("6");
                              },
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment:  CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                              child: Text("1",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("1");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text("2",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("2");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text("3",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("3");
                              },
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment:  CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                              child: Text("0",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add("0");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text(".",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                add(".");
                              },
                              color: Colors.blueAccent,
                            ),
                            ExpandedButton(
                              child: Text("=",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                getResult();
                              },
                              color: Colors.blue[50],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ExpandedButton(
                            child: Image.network(
                              "https://www.carminezacc.com/divide.png",
                              width: 10.0,
                              height: 10.0,
                            ),
                            onPressed: () {
                              add("/");
                            },
                          ),
                          ExpandedButton(
                            child: Text("x"),
                            onPressed: () {
                              add("x");
                            },
                          ),
                          ExpandedButton(
                            child: Text("-"),
                            onPressed: () {
                              add("-");
                            },
                          ),
                          ExpandedButton(
                            child: Text("+"),
                            onPressed: () {
                              add("+");
                            },
                          )
                        ],
                      ))
                ],
              )),
        ],
      ),
    );
  }
}

class ExpandedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;

  ExpandedButton({this.child, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        flex: 1,
        child: FlatButton(onPressed: onPressed, child: child, color: color));
  }
}

class ExpandedRow extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  ExpandedRow({this.children, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
        flex: 1,
        child: Row(children: children, crossAxisAlignment: crossAxisAlignment));
  }
}
