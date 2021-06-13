import 'dart:async';
import 'default.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  bool isOpen = false;
  bool inputApp = false;
  bool submitted = false;
  bool clicked = false;
  bool filePicked = false;
  bool isOpenComplete = false;
  bool initiated = false;

  late FilePickerResult file;
  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();
  List<String> allfiles = [];
  String selectedFile = "Selected FileName";
  // animation controllers
  //allfiles
  late AnimationController _controllerAllFile;
  late Animation _animationAllFile;
  Color textColorAllfile = ButtonColor.textColor;
  //upload
  late AnimationController _controllerUpload;
  late Animation _animationUpload;
  Color textColorUpload = ButtonColor.textColor;
  //submit
  late AnimationController _controllerSubmit;
  late Animation _animationSubmit;
  Color textColorSubmit = ButtonColor.textColor;
  @override
  void initState() {
    super.initState();
    _controllerAllFile = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _controllerUpload = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _controllerSubmit = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }
  @override
  Widget build(BuildContext context) {
    var windowsWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        var maxheight = constraints.maxHeight;
        double _width = windowsWidth * 0.4;
        double _height = maxheight * 0.1;
        double isopenH = maxheight * 0.4;
        double initposH =
            MediaQuery.of(context).size.height * 0.5 - (isopenH / 2);
        double initposW =
            MediaQuery.of(context).size.width * 0.5 - (_width / 2);
        return Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            top: submitted ? 50 : initposH,
            left: initposW,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if(!initiated) {
                    _animationAllFile = Tween(begin: 0.0, end: MediaQuery.of(context).size.width * 0.06).animate(CurvedAnimation(parent: _controllerAllFile, curve: Curves.easeIn))..addListener(() {
                      setState(() {});
                    });
                    _animationUpload = Tween(begin: 0.0, end: MediaQuery.of(context).size.width * 0.06).animate(CurvedAnimation(parent: _controllerUpload, curve: Curves.easeIn))..addListener(() {
                      setState(() {});
                    });
                    _animationSubmit = Tween(begin: 0.0, end: MediaQuery.of(context).size.width * 0.06).animate(CurvedAnimation(parent: _controllerSubmit, curve: Curves.easeIn))..addListener(() {
                      setState(() {});
                    });
                    setState(() {
                      initiated = true;
                    });
                  }
                  if (isOpen) {
                    setState(() {
                      isOpenComplete = false;
                      inputApp = !inputApp;
                      clicked = !clicked;
                      Timer(const Duration(milliseconds: 50), () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      });
                    });
                  } else {
                    setState(() {
                      clicked = !clicked;
                      isOpen = !isOpen;
                      Timer(const Duration(milliseconds: 500), () {
                        setState(() {
                          inputApp = !inputApp;
                          isOpenComplete = true;
                        });
                      });
                    });
                  }
                });
              },
              child: Center(
                child: AnimatedContainer(
                  curve: Curves.decelerate,
                  width: _width,
                  height: isOpen ? isopenH : _height,
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    //color: Color(0xff404040),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.indigoAccent, width: 5)
                  ),
                  child: Column(
                    mainAxisAlignment: isOpen
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: [
                      inputApp
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.05,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Question:',
                                    style: TextStyle(color: TextColor.color),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    child: TextField(
                                      style:
                                           TextStyle(color: TextColor.color),
                                      maxLines: 2,
                                      controller: question,
                                      cursorColor: Colors.indigoAccent,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.indigoAccent)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                  color: Colors.indigoAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.indigoAccent)),
                                          // suffixIcon: Icon(
                                          //   Icons.question_answer_outlined,
                                          //   color: Colors.black,
                                          // )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      inputApp
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.02,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.06,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2,
                                        )
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                  title: const Text('Select files'),
                                                  content: Container(
                                                    width: MediaQuery.of(context).size.width * 0.5 - (_width / 2),
                                                    child: ListView.builder(
                                                      itemCount: allfiles.length,
                                                      shrinkWrap: true,
                                                      itemBuilder: (context, index) {
                                                        return ListTile(
                                                          trailing: IconButton(
                                                            icon: Icon(Icons.delete),
                                                            onPressed: (){
                                                              setState(() {
                                                                allfiles.removeAt(index);
                                                              });
                                                            },
                                                          ),
                                                          title: Text(
                                                            allfiles[index],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                              )
                                          );
                                        },
                                        onHover: (value){
                                          if(value) {
                                            setState(() {
                                              _controllerAllFile.forward();
                                              textColorAllfile = ButtonColor.animatedTextColor;
                                            });
                                          } else {
                                            setState(() {
                                              _controllerAllFile.reverse();
                                              textColorAllfile = ButtonColor.textColor;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ButtonColor.animatedColor,
                                                    borderRadius:BorderRadius.circular(10.0),
                                                  ),
                                                  width: _animationAllFile.value,
                                                ),
                                              ),
                                              Center(
                                                child: AnimatedDefaultTextStyle(
                                                  duration: const Duration(milliseconds: 50),
                                                  style: TextStyle(color: textColorAllfile),
                                                  child: const Text('All Files'),
                                                  curve: Curves.easeIn,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.06,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                            color: Colors.indigoAccent,
                                            width: 2,
                                          )
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          var picked = await FilePicker.platform.pickFiles(
                                              allowMultiple: true,
                                              type: FileType.custom,
                                              allowedExtensions: ['txt', 'pdf', 'docs', 'doc']
                                          );
                                          if (picked != null) {
                                            for(int i=0;i<picked.files.length;i++) {
                                              setState(() {
                                                allfiles.add(picked.files[i].name);
                                              });
                                              print(picked.files[i].name);
                                            }
                                            setState(() {
                                              file = picked;
                                              filePicked = true;
                                            });
                                          }
                                          print(allfiles);
                                        },
                                        onHover: (value){
                                          if(value) {
                                            setState(() {
                                              _controllerUpload.forward();
                                              textColorUpload = ButtonColor.animatedTextColor;
                                            });
                                          } else {
                                            setState(() {
                                              _controllerUpload.reverse();
                                              textColorUpload = ButtonColor.textColor;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ButtonColor.animatedColor,
                                                    borderRadius:BorderRadius.circular(10.0),
                                                  ),
                                                  width: _animationUpload.value,
                                                ),
                                              ),
                                              Center(
                                                child: AnimatedDefaultTextStyle(
                                                  duration: const Duration(milliseconds: 50),
                                                  style: TextStyle(color: textColorUpload),
                                                  child: const Text('Upload'),
                                                  curve: Curves.easeIn,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.06,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                            color: Colors.indigoAccent,
                                            width: 2,
                                          )
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            inputApp = !inputApp;
                                          });
                                          Timer(const Duration(milliseconds: 50),
                                                  () {
                                                setState(() {
                                                  submitted = true;
                                                  isOpen = !isOpen;
                                                });
                                              });
                                        },
                                        onHover: (value){
                                          if(value) {
                                            setState(() {
                                              _controllerSubmit.forward();
                                              textColorSubmit = ButtonColor.animatedTextColor;
                                            });
                                          } else {
                                            setState(() {
                                              _controllerSubmit.reverse();
                                              textColorSubmit= ButtonColor.textColor;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ButtonColor.animatedColor,
                                                    borderRadius:BorderRadius.circular(10.0),
                                                  ),
                                                  width: _animationSubmit.value,
                                                ),
                                              ),
                                              Center(
                                                child: AnimatedDefaultTextStyle(
                                                  duration: const Duration(milliseconds: 50),
                                                  style: TextStyle(color: textColorSubmit),
                                                  child: const Text('Submit'),
                                                  curve: Curves.easeIn,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      isOpen? Container() : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (clicked && !submitted)
                                ? Container()
                                : Text(
                                    submitted
                                        ? question.text
                                        : 'Enter Your Question',
                                    style:
                                        const TextStyle(color: Colors.black)),
                            (clicked && !submitted)
                                ? Container()
                                : const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
              top: (submitted && !isOpen) ? MediaQuery.of(context).size.height * 0.25 : MediaQuery.of(context).size.height * 0.7,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                color: Color(0xffc9bebe),
                height: submitted ? MediaQuery.of(context).size.height * 0.65 : 0,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width * 0.8) * 0.3,
                      color: Color(0xffc7c4c4),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                            vertical: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                        ),
                        color: Color(0xff404040),
                        child: ListView.builder(
                          itemCount: allfiles.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    allfiles[index],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      selectedFile = allfiles[index];
                                    });
                                  },
                                ),
                                const Divider(
                                  color: Colors.indigoAccent,
                                  thickness: 1,
                                )
                              ],
                            );
                          }
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.8) * 0.5,
                      color: Color(0xffc7c4c4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        margin: EdgeInsets.symmetric(
                          horizontal: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                          vertical: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                        ),
                        color: Color(0xff404040),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                selectedFile,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width * 0.8) * 0.2,
                      color: Color(0xffc7c4c4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        margin: EdgeInsets.symmetric(
                            horizontal: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                          vertical: ((MediaQuery.of(context).size.width * 0.8) * 0.3)*0.06,
                        ),
                        color: Color(0xff404040),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Total Key Words:', style: TextStyle(color: Colors.white),),
                            SizedBox(
                              height: 50,
                            ),
                            Text('Total Key Words Found:', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              duration: const Duration(milliseconds: 500),
          )
        ]);
      },
    ));
  }
}
