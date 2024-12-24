// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class Token {
  final String token;
  final String refreshToken;

  Token({required this.token, required this.refreshToken});
}
