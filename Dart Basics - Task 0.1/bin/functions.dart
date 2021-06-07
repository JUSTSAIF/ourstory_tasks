// ================ dataTypes ================
String dataTypes() {
  String name = 'saif';
  int age = 18;
  double height = 167.4;
  bool isProgrammer = true;
  return 'Iam ${name}, my age is ${age},my height ${height}\nam i programmer ? : ${isProgrammer}';
}
// ================ Lists ================
String list(String stu,String method){
  List<String> students = ['saif','yasser','luffy'];
  var BeautiList = getBeautiList(students);
  if(method == 'add'){
    students.add(stu);
    return 'added success \n${BeautiList}';
  }else if(method == 'del'){
    students.remove(stu);
    return 'removed success\n${BeautiList}';
  }else if(method == 'get'){
    return 'students :\n${BeautiList}';
  }
  return 'Err :: Method not exist !!';
}
// ================ If Statement ================
String search(String word,String str){
  return str.contains(word) == true ? 'Exists 0w0' : 'not exists :(';
}
// ================ While ================
void spam(String word,int count){
  int i = 0;
  while(i<count){
    print(word);
    i++;
  }
}
// ================ ForLoop ================
String getBeautiList(List<String> list){
  String bL='';
  for(var e in list){
    bL+=e+',\n';
  }
  return bL;
}