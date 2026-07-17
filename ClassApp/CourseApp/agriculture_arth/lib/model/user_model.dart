class UserModel {
  String uid;
  String email;
  String role;
  String name; // ✅ ADD

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "role": role,
      "name": name, // ✅ ADD
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'] ?? "", // ✅ SAFE
    );
  }
}