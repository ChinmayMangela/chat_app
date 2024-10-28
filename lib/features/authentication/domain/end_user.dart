
class EndUser {
  final String id;
  final String name;
  final String email;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
  });

  factory EndUser.fromJson(Map<String, dynamic> data, String docId) {
    return EndUser(
      id: docId,
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
