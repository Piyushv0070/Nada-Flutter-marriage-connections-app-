class Profile {
  final int id;
  final String name;
  final int? age;
  final String? gender;
  final String? city;
  final String? community;
  final String? profession;
  final String? education;
  final int? degree;
  final String? connectedThrough;
  final String? about;

  Profile({
    required this.id,
    required this.name,
    this.age,
    this.gender,
    this.city,
    this.community,
    this.profession,
    this.education,
    this.degree,
    this.connectedThrough,
    this.about,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Name',
      age: json['age'],
      gender: json['gender'],
      city: json['city'],
      community: json['community'],
      profession: json['profession'],
      education: json['education'],
      degree: json['degree'],
      connectedThrough: json['connected_through'],
      about: json['about'],
    );
  }
}