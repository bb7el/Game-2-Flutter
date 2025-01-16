import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 35, 40),
          title: Center(
            child: Text("Examen",
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswerCount = 0;

  void checkAnswer(bool whatUserPicked) {
    bool corectAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == corectAnswer) {
        rightAnswerCount++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_up, color: Colors.green),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار !",
          desc: "لقد اجبت على $rightAnswerCount من أصل 7 اسئلة",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: Text(
                "ابدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        appBrain.reset();
        answerResult.clear();
        rightAnswerCount = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: answerResult.cast(),
      ),
      SizedBox(height: 10.0),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Image.asset(appBrain.getQuestionImage()),
            SizedBox(height: 20.0),
            Text(appBrain.getQuestionByText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.black)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Expanded(
            child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          child: Text(
            "صح",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            checkAnswer(true);
          },
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Expanded(
            child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: Text(
            "خطأ",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            checkAnswer(false);
          },
        )),
      )
    ]);
  }
}
