import 'package:dio/dio.dart';

class AuthorizationModel {
  final String uid;
  final String client;
  final String accessToken;

  AuthorizationModel({
    required this.uid,
    required this.client,
    required this.accessToken,
  });

  factory AuthorizationModel.fromHeaders(Headers headers) {
    return AuthorizationModel(
      uid: (headers['uid'] as List).first,
      client: (headers['client'] as List).first,
      accessToken: (headers['access-token'] as List).first,
    );
  }
}
