class Users {
  String email;
  String level;
  String profile_image;
  String username;
  String phone;
  String aboutMeDescription;

  // Constructor
  Users({
    required this.email,
    required this.level,
    required this.profile_image,
    required this.username,
    required this.phone,
    required this.aboutMeDescription,
  });

  Users copy({
    String? email,
    String? level,
    String? profile_image,
    String? username,
    String? phone,
    String? aboutMeDescription,
  }) =>
      Users(
        email: email ?? this.email,
        level: level ?? this.level,
        profile_image: profile_image ?? this.profile_image,
        username: username ?? this.username,
        phone: phone ?? this.phone,
        aboutMeDescription: aboutMeDescription ?? this.aboutMeDescription,
      );

  Users.fromJson(Map<String, Object?> json) : this(
    email: json['email']! as String,
    level: json['level']! as String,
    profile_image: json['profile_image']! as String,
    username: json['username']! as String,
    phone: json['phone']! as String,
    aboutMeDescription: json['about']! as String,
  );

  Map<String, Object?> toJson() => {
    'email': email,
    'level': level,
    'profile_image': profile_image,
    'username': username,
    'phone': phone,
    'aboutMeDescription': aboutMeDescription,
  };
}