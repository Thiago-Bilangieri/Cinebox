import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSinginService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSinginService,
  }) : _localStorageService = localStorageService,
       _googleSinginService = googleSinginService;
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
        await _localStorageService.saveIdToken(value);
        return successOfUnit();
      case Failure(:final error):
        log(
          'Error signing in',
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
