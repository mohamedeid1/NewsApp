import 'dart:io';

class agecala {
  info() {
    print("enter your birth year");
    int birthyear = stdin.readLineSync() as int;
    var age = DateTime.now().year - birthyear;
    print("your age is $age years old");
  }
}
