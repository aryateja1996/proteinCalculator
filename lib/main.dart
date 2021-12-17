import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miniproject/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Protein',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(title: 'Flutter Demo Home Page'),
    );
  }
}

class Splash extends StatefulWidget {
  Splash({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Duration duration = Duration(seconds: 3);
    Timer(duration, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black38,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black38,
        child: Center(
          child: Image.asset('assets/1.png'),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Protein Content'),
        actions: [
          Row(
            children: [
              Text(
                '--> Intake Calculator',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(
                  Icons.calculate_rounded,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => Calculator()));
                },
              ),
            ],
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black38,
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (ctx, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => PContent(value: names[i])));
                },
                child: Container(
                  width: 100,
                  height: 200,
                  color: Colors.green,
                  margin: EdgeInsets.all(7),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/Categories/${i + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                        height: double.infinity,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black45,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Text(
                            names[i],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class PContent extends StatefulWidget {
  final String value;
  const PContent({required this.value});

  @override
  _PContentState createState() => _PContentState();
}

class _PContentState extends State<PContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(widget.value),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, i) {
              return Container(
                width: 100,
                height: 420,
                //color: Colors.amber,
                decoration: BoxDecoration(
                  // color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 3.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        prodetails[widget.value]![i]['imgUrls']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prodetails[widget.value]![i]['name']!,
                              style:
                                  TextStyle(fontSize: 27, color: Colors.white),
                            ),
                            //SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Protein (100g) : ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  prodetails[widget.value]![i]['protein']! +
                                      ' g',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Text(
                                  'Calories : ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  prodetails[widget.value]![i]['calories']! +
                                      ' kcals',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String weight = '';
  String height = '';
  String age = '';
  bool male = false;
  bool isChecked = false;

  bool female = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.black38,
        child: Column(
          children: [
            Row(
              children: [
                Text('Age'),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      age = val;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Enter Height'),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      height = val;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text('Enter Weight'),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      weight = val;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Gender : '),
                SizedBox(
                  width: 20.0,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            male = value!;
                          });
                        }),
                    Text('Male'),
                    SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            female = value!;
                          });
                        }),
                    Text('Female'),
                  ],
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  double pro = 0.8 * double.parse(weight);
                  _showMyDialog(pro);
                },
                child: Text('Submit'))
          ],
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  Future<void> _showMyDialog(double pro) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Protein Intake Needed is :'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  pro.toStringAsFixed(3),
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
