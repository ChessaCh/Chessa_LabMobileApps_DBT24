import 'dart:io';
import 'dart:math';

void main(){
  Random random = Random();
  int angka = random.nextInt(100) + 1;

  stdout.write("Tebak angka antara 1 sampai 100: ");
  int input = int.parse(stdin.readLineSync()!);
  int cobaan = 0;
  while(input != angka){
    if(input < angka){
      print("Tebakan terlalu rendah. Coba lagi:");
      cobaan += 1;
    } else if(input > angka){
      print("Tebakan terlalu tinggi. Coba lagi:");
      cobaan += 1;
    }
    stdout.write("Masukkan tebakan baru: ");
    input = int.parse(stdin.readLineSync()!);
  }
  print("Yey! Tebakanmu benar, angkanya adalah $angka.");
  print("Jumlah tebakan: $cobaan");
}