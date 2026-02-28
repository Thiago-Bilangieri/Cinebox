import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSinginService;
  final AuthService _authService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSinginService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSinginService = googleSinginService,
       _authService = authService;
  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();
    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSinginService.signIn();
    switch (result) {
      case Success<String>(:final value):
        try {
          await _localStorageService.saveIdToken(value);
          await _authService.auth();
          return successOfUnit();
        } on DioException catch (e, s) {
          log(
            'Error authenticating with backend',
            name: 'AuthRepositoryImpl.signIn',
            error: e,
            stackTrace: s,
          );
          return Failure(
            DataException(message: 'Error signing in google account'),
          );
        }
      case Failure<String>(:final error):
        log(
          'Error signing in with google',
          name: 'AuthRepositoryImpl.signIn',
          error: error,
        );
        return Failure(
          DataException(message: 'Error signing in google account'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSinginService.signOut();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log(
              'Error removing id token',
            );
            return Failure<Unit>(error);
        }
      case Failure(:final error):
        log(
          'Error signing out',
          name: 'AuthRepositoryImpl.signOut',
          error: error,
        );
        return Failure(
          DataException(message: 'Error signing out google account'),
        );
    }
  }
}
