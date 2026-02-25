import 'package:cinebox/config/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _secureStorage;

  LocalStorageServiceImpl({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  @override
  Future<Result<String>> getIdToken() async {
    final token = await _secureStorage.read(key: 'id_token');
    if (token != null) {
      return Success(token);
    }
    return Failure(Exception('ID token not found'));
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _secureStorage.delete(key: 'id_token');
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken(String token) async {
    await _secureStorage.write(key: 'id_token', value: token);
    return successOfUnit();
  }
}
