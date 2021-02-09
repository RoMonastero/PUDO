import 'package:flutter_gofast/app/core/responses/responses_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginGoogle();
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logOut();
}
