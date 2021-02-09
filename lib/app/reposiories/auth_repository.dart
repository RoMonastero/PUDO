import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gofast/app/core/errors/register_error_interceptor.dart';
import 'package:flutter_gofast/app/core/responses/responses_builder.dart';
import 'package:flutter_gofast/app/core/responses/responses_default.dart';
import 'package:flutter_gofast/app/interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
        (auth) {
          return ResponseBuilder.success<FirebaseUser>(object: auth.user);
        },
      );
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.code,
          errorInterceptor: RegisterErrorInterceptor());
    }
  }
}
