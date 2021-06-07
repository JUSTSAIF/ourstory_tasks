import 'dart:math';
import 'dart:io';

num getNum(){
  print('Enter Number :');
  return num.parse(stdin.readLineSync()!);
}

class Cal {
  var n1, n2;
  Cal() {
    n1 = getNum();
    n2 = getNum();
  }
  num plus() {
    return n1 + n2;
  }
  num minus(){
    return n1 - n2;
  }
}

String calWithSwitch(){
  var n1 = getNum();
  var n2 = getNum();
  print('Enter Method :');
  String method = stdin.readLineSync()!;
  switch(method){
    case '+':return (n1+n2).toString();
    case '-':return (n1-n2).toString();
    case '*':return (n1%n2).toString();
    case '/':return (n1%n2).toString();
    case '%':return (n1%n2).toString();
    default:return 'Method Not Found !!';
  }
}