import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_cal/main.dart';

class resultScreen extends StatelessWidget {
  final bmimodel;

  resultScreen({required this.bmimodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back to BMI Calculation"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => homepage()));
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(180.0),
                      bottomLeft: Radius.circular(180.0))),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Container(
                      height: 200,
                      width: 200,
                      child: Image(
                          image: AssetImage(bmimodel.isNormal
                              ? "images/heart.png"
                              : "images/sad.png")))
                ],
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Your BMI is : ${bmimodel.bmiresult.round()}",
              style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.red),
            ),
            SizedBox(height: 30),
            Text("${bmimodel.rescomments}",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.pinkAccent)),
          ],
        ),
      ),
    );
  }
}
