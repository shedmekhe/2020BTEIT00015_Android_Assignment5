// import 'dart:html';
import 'package:assignment_no5/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_use.dart';
import 'constant.dart';
import 'result.dart';
import 'package:assignment_no5/calculation_part.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
   InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour=inactiveColor;
  Color femaleCardColour=inactiveColor;

  void updateColour(Gender gender)
  {
    if(gender==Gender.male) {
      if (maleCardColour == inactiveColor) {
        maleCardColour = activeColor;
        femaleCardColour=inactiveColor;
      }
      else {
        maleCardColour = inactiveColor;
      }
    }
    if(gender==Gender.female) {
      if (femaleCardColour == inactiveColor) {
        femaleCardColour = activeColor;
        maleCardColour=inactiveColor;
      }
      else {
        femaleCardColour = inactiveColor;
      }
    }
  }
  int height =180;
  int weight =56;
  int age =18;
  @override
  Widget build(BuildContext context) {
    // Size size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator",style:TextStyle(color: Colors.lightGreen ))),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              flex: 0,
                child: Row(
              children:  <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>{
                       setState((){ updateColour(Gender.male);}
                       ),
                    },
                    child: ReusableExpanded(
                      colour: maleCardColour,
                      cardChild: IconContent(icon1: FontAwesomeIcons.mars,label:'MALE\n',),
                    ),
                  ),

                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>{
                      setState((){updateColour(Gender.female);})
                    },
                    child: ReusableExpanded(
                      colour:femaleCardColour,
                        cardChild: IconContent(icon1: FontAwesomeIcons.venus,label: 'FEMALE\n'),

                        ),
                  ),
                  ),
                      ],
                      ),
                      ),
            SizedBox(height: 25.0),
            Expanded(
              flex: 0,
              child: ReusableExpanded(
                colour: inactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Text(
                        '\nHEIGHT',
                        style:labelTextStyle,
                      ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextStylenum,
                        ),
                        Text(
                          'cm',
                        style: kTextStylenum,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: Colors.blueGrey,
                        activeTrackColor: Colors.black,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 11.0),
                        thumbColor: Colors.black,
                        overlayColor: Colors.black38,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height=newValue.round();
                          });
                        },),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:30.0),
            Expanded(
              flex: 0,
                child: Row(
              children:  <Widget>[
                Expanded(
                  child: ReusableExpanded(
                    colour: inactiveColor,
                    cardChild: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\nWEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style:kTextStylenum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundIconButton(
                             icon:FontAwesomeIcons.plus,
                             onPressed: (){
                               setState(() {
                                 weight++;
                               });

                               print(weight);
                             },
                           ),
                        SizedBox(width: 10.0),
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                        onPressed:() {
                            setState(() {
                              weight--;
                            });
                        },
                      ),
                      ],
                     ),
                    ],
                    ),
                  ),
                ),
                Expanded(
                  child:ReusableExpanded(
                    colour: inactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\nAGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStylenum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                             onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                             },
                           ),
                           SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          onPressed: (){
                              setState(() {
                                age--;
                              });
                          },
                        ),
                        ],
                      ),
                    ],
                    ),
                  ),
                ),
              ],
            ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(5.0),
              child: ElevatedButton(
                child:Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.green,
                ),
                onPressed: () {
                  CalculatorMaster calc=CalculatorMaster(height : height, weight:weight);
                 Navigator.push(context,
                     MaterialPageRoute(builder:(context)=>ResultPage(
                       bmiResult: calc.calculateBMI(),
                       resultText: calc.get_Result(),
                       interpretation: calc.get_interpretation(),
                     ),
                  ),
                 );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  RoundIconButton({Key? key, required this.icon,required this.onPressed}) : super(key: key);

  // final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.black38,
      child:Icon(icon,
      color: Colors.white
        ,),
      onPressed:onPressed,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 50.0,
      ),
      fillColor: Colors.black,
    );
  }
}
