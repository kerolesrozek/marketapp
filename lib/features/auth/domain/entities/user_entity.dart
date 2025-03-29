class UserEntity {
  final String email;
  final String password;
  final String name;

  UserEntity(
    this.name, {
    required this.email,
    required this.password,
  });
}
