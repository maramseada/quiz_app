import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(MyApp());
}

QuizBrain quizbrain = QuizBrain();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dataitem = 0;
  var dataKeys = '';
  var ques = '';
  var datavalue = false;
  var buttonEnabled = true;
  var count = 0;

  @override
  void initState() {
    super.initState();
    dataKeys = quizbrain.questions[dataitem].ques;
    datavalue = quizbrain.questions[dataitem].answer;
    checkanswer(false);

  }

  checkanswer(bool Answ) {
    setState(() {
      if (Answ == datavalue) {
        count++;
        print('true');
        print(dataitem);
      } else {
        print('false');
      }
    });
  }

  void updatequestion() {
    setState(() {
      if (dataitem < quizbrain.questions.length) {
        dataitem++;
        dataKeys = quizbrain.questions[dataitem].ques;
        datavalue = quizbrain.questions[dataitem].answer;
      } else {
        buttonEnabled = false;
        dataKeys = 'Questions done ';
        print('finished');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    dataKeys,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                ),
                const SizedBox(
                  height: 130,
                ),
                SizedBox(
                  height: 80, //height of button
                  width: double.infinity, //w
                  child: ElevatedButton(
                    onPressed: buttonEnabled
                        ? () {
                            setState(() {
                              checkanswer(true);
                              updatequestion();
                            });
                          }
                        : null,
                    child: Text('true'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      side: BorderSide(width: 3, color: Colors.black45),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80, //height of button
                  width:
                      double.infinity, //width of button equal to parent widget
                  child: ElevatedButton(
                    onPressed: buttonEnabled
                        ? () {
                            setState(() {
                              checkanswer(false); // Move this line here
                              updatequestion();
                            });
                          }
                        : null,
                    child: Text('false'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: BorderSide(width: 3, color: Colors.black45),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (!buttonEnabled )
                  Text(
                    'Your total is $count',
                    style: TextStyle(color: Colors.white, fontSize: 18.0,),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
