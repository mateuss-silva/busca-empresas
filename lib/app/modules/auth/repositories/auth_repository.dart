import 'package:empresas_flutter/app/modules/auth/irepositories/iauth_repository.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<InvestorModel> login(LoginViewModel login) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
}