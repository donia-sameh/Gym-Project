class Clerk {
  final int? clerkId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;

  Clerk({
    this.clerkId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory Clerk.fromMap(Map<String, dynamic> json) => Clerk(
        clerkId: json['clerkId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
      );

  Map<String, dynamic> toMap() => {
        "clerkId": clerkId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      
      };
}
