import 'package:dio/dio.dart';

class BaseRepository {
  String get baseUrl => "https://empresas.ioasys.com.br";
  String get api => "$baseUrl/api";
  String get users => "$api/users";
  String get auth => "$users/auth";
  String get signIn => "$auth/sign_in";

  final Dio _dio;

  get dio => _dio;

  BaseRepository(this._dio) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {"Content-Type": "application/json; charset=UTF-8"};
  }

  setToken(String token) => _dio.options.headers["access-token"] = token;

  setUid(String uid) => _dio.options.headers["uid"] = uid;

  setClient(String client) => _dio.options.headers["client"] = client;
}
