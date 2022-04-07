import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/modules/auth/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {
  late AuthRepository repository;

  setUpAll(() {
    repository = AuthRepository(Dio());
  });
}