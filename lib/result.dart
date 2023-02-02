import 'package:flutter/material.dart';
import 'color.dart';
import 'questions-and-answers.dart';

class Result extends StatelessWidget {
  final Function restartApp;
  final int totalScore;

  Result(this.restartApp, this.totalScore);

  String get resultPhrase {
    String resultText;
    if (totalScore < 5) {
      resultText = "يا ساقط";
    } else if (totalScore == 5) {
      resultText = "على الحفة تعتبر راسب";
    } else if (totalScore < 8 && totalScore > 5) {
      resultText = "جيد";
    }else if(totalScore == 8){
      resultText = "جيد جدا";
    } else if(totalScore == 9) {
      resultText = "ممتاز";
    }else{
      resultText = "متميز";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 110,),
        Text("انتهت الاسئلة",
            style: TextStyle(
                color: black, fontSize: 50, fontWeight: FontWeight.w900)),
        const SizedBox(height: 20,),
        Text("10"+ " درجتك هي"+ "${totalScore}"+ " من",
          style: const TextStyle(color:Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),),
        Text('$resultPhrase',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: red,
              fontSize: 30

          ),
        ),
        const SizedBox(height: 70),
        TextButton(
            onPressed: () {
              restartApp();
            },
            child: Text("إعادة الاختبار",
                style: TextStyle(
                  color: blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ))),

      ],
    );
  }
}