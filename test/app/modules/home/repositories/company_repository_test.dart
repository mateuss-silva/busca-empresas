import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:empresas_flutter/app/modules/home/repositories/enterprise_repository.dart';

void main() {
  late EnterpriseRepository repository;

  setUpAll(() {
    repository = EnterpriseRepository(Dio());
  });
}
