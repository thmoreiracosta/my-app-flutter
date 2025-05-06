class AppUser {
  final String id;
  final String name;
  final String photoUrl;
  final String bio;
  final String specialty;

  AppUser({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.bio,
    required this.specialty,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      name: map['name'],
      photoUrl: map['photoUrl'],
      bio: map['bio'],
      specialty: map['specialty'],
    );
  }
}
