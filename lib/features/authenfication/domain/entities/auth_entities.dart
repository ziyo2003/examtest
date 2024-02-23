class AuthEntities {
  final String? avatar;
  final String email;
  AuthEntities({
    required this.email,
    this.avatar,
  });
  AuthEntities copyWith({
    String? email,
    String? avatar,
  }) {
    return AuthEntities(
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
    );
  }
  @override
  String toString() => 'AuthEntities(email: $email, avatar: $avatar)';

  @override
  bool operator ==(covariant AuthEntities other) {
    if (identical(this, other)) return true;
    return 
      other.email == email && other.avatar == avatar;
  }
  @override
  int get hashCode => email.hashCode ^ avatar.hashCode;
}
