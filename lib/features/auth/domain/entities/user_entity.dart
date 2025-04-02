class UserEntity {
  final String email;
  final String? password;
  final String name;
  final String? userId;

  UserEntity(
    {
       this.userId,
    required this.name,
    required this.email,
     this.password,
  });
}
