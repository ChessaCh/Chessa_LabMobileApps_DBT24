void main() {
  Account account = Account();
  account.main();
}

class Account {
  String username = "chessa";
  int balance = 5000000;
  
  void main() {
    print("Username: $username");
    print("Balance: $balance");
    deposit(2000000);
    print("Balance setelah deposit sebanyak 2000000: $balance");
    withdraw(1500000);
    print("Balance setelah withdraw sebanyak 1500000: $balance");
  }

  void deposit(int angka) {
    balance += angka;
  }

  void withdraw(int angka) {
    balance -= angka;
  }
}