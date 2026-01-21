import 'dart:io';
void main() {
  Ujian ujian = Ujian();
  ujian.data();
}

class Ujian {
  void data() {
    List<String?> students = [];
    List<int> nilais = [];
    for (var i = 0; i < 3; i++) {
    stdout.write("Input nama student: ");
    String? student = stdin.readLineSync();
    stdout.write("Input nilai student: ");
    int nilai = int.parse(stdin.readLineSync()!);
    tambahnilai(nilai);
    students.add(student);
    nilais.add(nilai);
    print("Nama Student: $student, Nilai: $nilai");
    print("Rata-rata nilai saat ini: ${ratarata()}");
    }
  }
  int totalnilai = 0;
  int jumlahstudent = 0;

  void tambahnilai(int nilai) {
    totalnilai += nilai;
    jumlahstudent += 1;
  }
  num ratarata() {
    return totalnilai / jumlahstudent;
  }
}