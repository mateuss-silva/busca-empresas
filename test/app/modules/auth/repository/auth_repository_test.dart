import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:empresas_flutter/app/modules/auth/repositories/auth_repository.dart';
 
void main() {
  late AuthRepository repository;

  setUpAll(() {
    repository = AuthRepository(BaseApi(Dio()));
  });
}