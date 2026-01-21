import 'dart:io';

void main(){
  stdout.write("angka: ");
  int angka = int.parse(stdin.readLineSync()!);
  List<int> faktor = [];
  for (var i = 1; i <= angka; i++) {
    if (i != angka) {
      if (angka % i == 0) {
        faktor.add(i);
      }
    }
  } 
  int jumlah = 0;
  for (var i in faktor) {
   jumlah += i;
   if (jumlah == angka) {
     print("True");
     break;
   } else if (jumlah > angka) {
     print("False");
     break;
   } 
  } if (jumlah != angka) {
    print("False");
  }
  print(faktor);
}