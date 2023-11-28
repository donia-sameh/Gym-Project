class Coach {
  late int? _coachId;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _password;
  late String _phoneNumber;
  late int _age;

  Coach(dynamic obj) {
    _coachId = obj['coachId'];
    _firstName = obj['firstName'];
    _lastName = obj['lastName'];
    _email = obj['email'];
    _password = obj['password'];
    _phoneNumber = obj['phoneNumber'];
    _age = obj['age'];
  }

  Coach.fromMap(Map<String, dynamic> data) {
    _coachId = data['coachId'];
    _firstName = data['firstName'];
    _lastName = data['lastName'];
    _email = data['email'];
    _password = data['password'];
    _phoneNumber = data['phoneNumber'];
    _age = data['age'];
  }

  Map<String, dynamic> toMap() => {
        "coachId": coachId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "age": age,
      };

  int? get coachId => _coachId;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  String get phoneNumber => _phoneNumber;
  int get age => _age;
}
