import 'package:dio/dio.dart';

class BaseApi {
  static String baseUrl = "https://empresas.ioasys.com.br";
  static String apiPath = "$baseUrl/api";
  static String v1Path = "$apiPath/v1";
  static String usersPath = "$v1Path/users";
  static String authPath = "$usersPath/auth";
  static String signInPath = "$authPath/sign_in";
  static String enterprisesPath = "$v1Path/enterprises";

  final Dio _dio;

  get dio => _dio;

  BaseApi(this._dio) {
    dio.options.baseUrl = baseUrl;
    dio.options.headers = {"Content-Type": "application/json; charset=UTF-8"};
  }

  setToken(String token) => dio.options.headers["access-token"] = token;

  setUid(String uid) => dio.options.headers["uid"] = uid;

  setClient(String client) => dio.options.headers["client"] = client;
}
