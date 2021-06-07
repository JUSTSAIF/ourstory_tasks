import 'dart:io';

class Member {
  Member(String _name, int _age, String _section, String _role,bool emp){
    name = _name;
    age = _age;
    section = _section;
    role = _role;
    Employee = emp;
  }
  String? name;
  int? age;
  String? section;
  String? role;
  bool? Employee;
}

class ourstory{
  List<Member> members = [Member('Saif', 18, 'IT', 'Founder-_-', false)];
  void options(){
    print('''
    ===========================
    =    1 - Add new member   =
    =    2 - Remove member    =
    =    3 - Get Member       = 
    ===========================
    
    Enter Option : ''');
    var op = stdin.readLineSync();
    if(op == '1'){
      add();
    }else if(op == '2'){
      remove();
    }
    else if(op == '3'){
      get();
    }
    else{
      options();
    }
  }
  void add(){
    var name = setinput('Member name : ');
    var age = setinput('Member age (integer) : ');
    var section = setinput('Member section : ');
    var role = setinput('Member Role :');
    var Employee = setinput('Member is Employee ? (true , false) :');
    Member newMember = new Member(name,int.parse(age),section,role,Employee == "true"? true : false);
    members.add(newMember);
    options();
  }
  void remove(){
    var name = setinput('Name of Member  =>');

      for(var m in members){
        if(m.name == name){
          members.remove(m);
          print('Removed Success');
          break;
        }
        print('Member Not Found !!');
      }
    options();
  }
  void get(){
    print(getBeautiMem(members));
    options();
  }
  String setinput(String str){
    print(str);
    return stdin.readLineSync()!;
  }
  String getBeautiMem(List<Member> list){
    String bL='                  Ourstory Members';
    for(var e in list){
      bL+='''\n
      =============== Member ================
      =   Name : ${e.name}                      
      =   Age : ${e.age}                      
      =   Section : ${e.section}                      
      =   Role : ${e.role}                      
      =   Is Employee ? : ${e.Employee}                     
      ==================End==================
      ''';
    }
    return bL;
  }
}
