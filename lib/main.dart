import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_cal/bmi_result.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.reblack),
      home: homepage(),
    ));

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double weight = 0.0;
  double height = 0.0;
  double bmi = 0.0;

  late calmodel _calmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180.0),
                      bottomRight: Radius.circular(180.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4.0, spreadRadius: 2.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text("BMI Calculator",
                        style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            wordSpacing: 8.0,
                            letterSpacing: 1.2)),
                    SizedBox(height: 15),
                    Container(
                      width: 240,
                      height: 190,
                      child: Image(
                        image: AssetImage("images/sad.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Select Your Height (cm)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Slider(
                  value: height,
                  onChanged: (_height) {
                    setState(() {
                      height = _height;
                    });
                  },
                  min: 0,
                  max: 200,
                  divisions: 800,
                  label: "$height",
                ),
                Text(
                  "$height cm",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.pinkAccent),
                ),
                SizedBox(height: 40),
                Text(
                  "Select Your Weight (kg)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Slider(
                  value: weight,
                  onChanged: (_weight) {
                    setState(() {
                      weight = _weight;
                    });
                  },
                  min: 0,
                  max: 150,
                  divisions: 600,
                  label: "$weight",
                ),
                Text(
                  "$weight kg",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.pinkAccent),
                ),
                SizedBox(height: 40),
                FlatButton(
                    color: Colors.redAccent,
                    splashColor: Colors.pinkAccent,
                    child: Text("Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                    onPressed: () {
                      bmi = weight / ((height / 100) * (height / 100));
                      if (bmi >= 18.5 && bmi < 25.0) {
                        _calmodel = calmodel(
                            bmiresult: bmi,
                            isNormal: true,
                            rescomments: "your are normal");
                      } else if (bmi < 18.5) {
                        _calmodel = calmodel(
                            bmiresult: bmi,
                            isNormal: false,
                            rescomments: "your are underweight");
                      } else if (bmi >= 25.0 && bmi <= 30.00) {
                        _calmodel = calmodel(
                            bmiresult: bmi,
                            isNormal: false,
                            rescomments: "your are overweight");
                      } else if (bmi > 30.00) {
                        _calmodel = calmodel(
                            bmiresult: bmi,
                            isNormal: false,
                            rescomments: "your are obesed");
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  resultScreen(bmimodel: _calmodel)));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class calmodel {
  double bmiresult;
  bool isNormal;

  String rescomments;

  calmodel(
      {required this.bmiresult,
      required this.isNormal,
      required this.rescomments});
}
