import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(
          :final idToken?,
        ),
      )) {
        return Success(idToken);
      } else {
        return Failure(Exception('User is not signed in with Google'));
      }
    } catch (e, s) {
      log(
        'Error checking Google sign-in status: ',
        name: 'GoogleSinginService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to check Google sign-in status'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: [
          'email',
          'profile',
          'openid',
        ],
      );
      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      } else {
        return Failure(Exception('Failed to sign in with Google'));
      }
    } catch (e, s) {
      log(
        'Error signing in with Google: ',
        name: 'GoogleSinginService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to sign in with Google: $e'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Error signing out from Google: ',
        name: 'GoogleSinginService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to sign out from Google'));
    }
  }
}
