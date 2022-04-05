import 'dart:math';

class CalculatorMaster{
  final int height;
  final int weight;
  CalculatorMaster({required this.height,required this.weight});
  double _bmi=0;
  String calculateBMI()
  {
    _bmi=weight /pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String get_Result()
  {
    if(_bmi >=25) {
      return 'Overweight';
    }
    else if(_bmi>18.5)
      {
        return 'Normal';
      }
    else
      {
        return 'Underweight';
      }
  }
  String get_interpretation()
  {
    if(_bmi >=25) {
      return 'You have a Higher BMI than Normal. Try to exercise more';
    }
    if(_bmi>=18.5)
    {
      return 'You have a Normal BMI ,Keep it up';
    }
    else
    {
      return 'You have a Lower BMI than Normal . Maintain your food Habits';
    }
  }
}
