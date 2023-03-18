class User {
  User({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.telegram,
  });

  late String fullName;
  late String email;
  late String phone;
  late String telegram;

  set setFullName(String newFullName){
    fullName = newFullName;
  }

  set setEmail(String newEmail){
    email = newEmail;
  }

  set setPhone(String newPhone){
    phone = newPhone;
  }

  set setTelegram(String newTelegram){
    telegram = newTelegram;
  }
}
