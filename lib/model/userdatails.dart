class UserDetails {
  final String id;
  final String email;
  final String first_name;
  final String last_name;

  UserDetails(
    this.id,
    this.email,
    this.first_name,
    this.last_name,
  );

  UserDetails.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        first_name = json["first_name"],
        last_name = json["last_name"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
      };
}
