class User {
  late int? _userId;
  late String _email;
  late String _password;
  late String _firstName;
  late String _lastName;
  late String _address;
  late String _phoneNumber;
  late String? _paymentType;
  late int? _age;
  late String _gender;

  User(dynamic obj) {
    _userId = obj['userId'];
    _email = obj['email'];
    _password = obj['password'];
    _firstName = obj['firstName'];
    _lastName = obj['lastName'];
    _address = obj['address'];
    _phoneNumber = obj['phoneNumber'];
    _paymentType = obj['paymentType'];
    _paymentType = obj['paymentType'];
    _paymentType = obj['paymentType'];
    _age = obj['age'];
    _gender = obj['gender'];
  }

  User.fromMap(Map<String, dynamic> json) {
    _userId = json['userId'];
    _email = json['email'];
    _password = json['password'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _address = json['address'];
    _phoneNumber = json['phoneNumber'];
    _paymentType = json['paymentType'];
    _paymentType = json['paymentType'];
    _paymentType = json['paymentType'];
    _age = json['age'];
    _gender = json['gender'];
  }

  Map<String, dynamic> toMap() => {
        "userId": _userId,
        "email": _email,
        "password": _password,
        "firstName": _firstName,
        "lastName": _lastName,
        "address": _address,
        "phoneNumber": _phoneNumber,
        "paymentType": _paymentType,
        "age": _age,
        "gender": _gender,
      };

  int? get userId => _userId;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  String get address => _address;
  String get phoneNumber => _phoneNumber;
  String? get paymentType => _paymentType;
  int? get age => _age;
  String? get gender => _gender;

  set email(String email) {
    _email = email;
  }

  set firstName(String firstName) {
    _firstName = firstName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  set paymentType(String? paymentType) {
    _paymentType = paymentType;
  }

  set age(int? age) {
    _age = age;
  }
}
