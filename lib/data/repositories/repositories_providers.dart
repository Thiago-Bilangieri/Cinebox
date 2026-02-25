import 'package:cinebox/data/repositories/auth/auth_repository.dart';
import 'package:cinebox/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox/data/services/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@Riverpod()
AuthRepository authRepository(Ref ref) {
  var googleSinginServiceProvider;
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSinginService: ref.read(googleSinginServiceProvider),
  );
}
