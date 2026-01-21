import 'dart:io';

void main(){
  stdout.write("Apakah ini bilangan prima: ");
  int input = int.parse(stdin.readLineSync()!);
  if (input % input == 0 && input % 1 == 0 && input != 1 && input != 0 && input > 0 && input % 2 != 0 || input == 2 && input % 3 != 0) {
    print("True");
  } else {
    print("False");
  }
}