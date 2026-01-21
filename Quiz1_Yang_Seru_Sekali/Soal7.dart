
void main(){
  List a = [1,3,5,7];
  List b = [2,4,6,8];
  List c = [];
  c.addAll(a);
  c.addAll(b);
  c.sort();
  print(c);

  print("Nilai terbesar kedua: ${c[c.length - 2]}");

}