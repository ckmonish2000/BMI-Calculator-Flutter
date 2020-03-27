import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String  calculateBMI(){
    _bmi=weight/pow(height/100,2);
    var x=_bmi.toStringAsFixed(2);
    return x;
  }
  String getResult(){
    if(_bmi>25){
      return 'over Weight';
    }else if(_bmi>18.5){
      return 'normal';
    }
    else{
      return 'under Weight';
    }
  }
  String getInterpretation(){
    if(_bmi>25){
      return 'eat less';
    }else if(_bmi>18.5){
      return 'Maintain ur weight';
    }
    else{
      return 'eat something ';
    }
  }
}