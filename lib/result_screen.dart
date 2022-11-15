import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
        required this.result,
        required this.isMale,
        required this.age})
      : super(key: key);

  final double result;

  final bool isMale;

  final int age;

  String get resultPhrase {
    String resultText = "";
    if (result >= 30) {
      resultText = "Obese";
    } else if (result > 25 && result < 30) {
      resultText = "Overweight";
    } else if (result < 18.5 && result <= 24.9) {
      resultText = "Normal";
     } else {
        resultText = "Thin";
      }
      return resultText;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Your Result", style: Theme
              .of(context)
              .textTheme
              .headline1,),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Gender : ${isMale ? "male" : "female"} ",
                  style: //const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                  Theme
                      .of(context)
                      .textTheme
                      .headline2,
                ),
                Text(
                  "Result : ${result.toStringAsFixed(2)} ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,
                ),
                Text(
                  "Age : $age ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,
                ),
                Text(
                  "Healthiness : $resultPhrase ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
