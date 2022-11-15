import 'dart:math';

import 'package:flutter/material.dart';
import 'result_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  double height = 160;

  double weight = 70;

  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    m1Expanded(context, "male"),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "$height",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "cm",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.roundToDouble();
                          });
                        },
                        max: 300,
                        min: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    m2Expanded(context, "weight"),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.pink,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                child: TextButton(
                    onPressed: () {
                      double result = weight / pow(height / 100, 2);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Result(
                              result: result, age: age, isMale: isMale);
                        }),
                      );
                    },
                    child: Text(
                      "Calculate",
                      style: Theme.of(context).textTheme.headline2,
                    ))),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == "male") ? true : false;
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.grey[800]
                : Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                type == "male" ? "male" : "female",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[800],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == "age" ? "age" : "weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == "age" ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "age" ? "age++" : "weight++",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  heroTag: type == "age" ? "age--" : "weight--",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
