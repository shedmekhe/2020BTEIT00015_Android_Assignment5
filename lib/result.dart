import 'package:assignment_no5/constant.dart';
import 'package:assignment_no5/input_page.dart';
import 'package:assignment_no5/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation,required this.bmiResult,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your BMI :',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
            ),
          ),
          ),
          Expanded(
              flex: 5,
              child: ReusableExpanded(
                colour: Colors.black,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                        interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

              ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(5.0),
            child: ElevatedButton(
              child:Text(
                'RE-CALCULATE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shadowColor: Colors.black,

              ),
              onPressed: () {
               Navigator.pop(context);
              },
            ),
          )
        ],
      )
    );
  }
}

// class ResultPage extends StatefulWidget {
//   const ResultPage({Key? key}) : super(key: key);
//
//   @override
//   State<ResultPage> createState() => _ResultPageState();
// }
//
// class _ResultPageState extends State<ResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
