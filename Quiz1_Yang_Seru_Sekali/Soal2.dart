import 'dart:io';
import 'dart:math';

void main(){
  Random random = Random();
  int komputer = random.nextInt(3);
  if (komputer == 0) {
    print("Komputer memilih Gunting");
  } else if (komputer == 1) {
    print("Komputer memilih Batu");
  } else {
    print("Komputer memilih Kertas");
  }
  
  stdout.write("Pilih Gunting-Batu-Kertas (G/B/K): ");
  String? input = stdin.readLineSync();

  if (input == "G" || input == "g") {
    print("Kamu memilih Gunting");
  } else if (input == "B" || input == "b") {
    print("Kamu memilih Batu");
  } else if (input == "K" || input == "k") {
    print("Kamu memilih Kertas");
  } else {
    print("Pilihan tidak valid");
  }

  if ((input == "G" || input == "g") && komputer == 0 ||
      (input == "B" || input == "b") && komputer == 1 ||
      (input == "K" || input == "k") && komputer == 2) {
    print("Hasil: Seri");
  } else if ((input == "G" || input == "g") && komputer == 1 ||
             (input == "B" || input == "b") && komputer == 2 ||
             (input == "K" || input == "k") && komputer == 0) {
    print("Hasil: Kamu Kalah");
  } else if ((input == "G" || input == "g") && komputer == 2 ||
             (input == "B" || input == "b") && komputer == 0 ||
             (input == "K" || input == "k") && komputer == 1) {
    print("Hasil: Kamu Menang");
  } else {
    print("Tidak dapat menentukan hasil karena pilihan tidak valid");
  }
}