import 'dart:io';

void main(){
  List prima = [1,2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97];
  List a = []; 
  stdout.write("Apakah ini bilangan prima: ");
  int input = int.parse(stdin.readLineSync()!);
  if (prima.contains(input)) {
    print("True");
  } else {
    print("False");
  }
}