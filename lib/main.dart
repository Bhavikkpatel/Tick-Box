import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Correctness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Correctness: Home'),
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
  bool isOpen = false;
  bool inputApp = false;
  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var windowsHeight = MediaQuery.of(context).size.height;
    var windowsWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
          var maxheight = constraints.maxHeight;
          var maxwidth = constraints.maxWidth;
          double _width = maxwidth * 0.4;
          double _height = maxheight * 0.1;
          double isopenW = _width + MediaQuery.of(context).size.width * 0.05;
          double isopenH = maxheight * 0.4;
          return GestureDetector(
            onTap: () {
              setState(() {
                if(isOpen) {
                  setState(() {
                    inputApp = !inputApp;
                    Timer(const Duration(milliseconds: 50), (){
                      setState(() {
                        isOpen = !isOpen;
                      });
                    });
                  });
                } else {
                  setState(() {
                    isOpen = !isOpen;
                    Timer(const Duration(milliseconds: 500), (){
                      setState(() {
                        inputApp = !inputApp;
                      });
                    });
                  });
                }
              });
            },
            child: Center(
              child: AnimatedContainer(
                curve: Curves.elasticInOut,
                width:  _width,
                height: isOpen ? isopenH: _height,
                duration: const Duration(milliseconds: 1100),
                decoration: const BoxDecoration(
                  //color: Color(0xffFAF9F9),
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inputApp ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            )
                          ),
                          onPressed: (){},
                          child: const Text('Upload'),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              )
                          ),
                          onPressed: (){
                            evaluateReq();
                          },
                          child: const Text('Submit'),
                        )
                      ],
                    ) : Container(),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }

  evaluateReq() {
    print(question.text);
    print(answer.text);
    setState(() {
      inputApp = !inputApp;
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isOpen = !isOpen;
      });
    });
  }
}
