import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(
    varName: 'GOOGLE_API_KEY',
    obfuscate: true,
  )
  static final String googleApiKey = _Env.googleApiKey;

  @EnviedField(
    varName: 'BACKEND_BASE_URL',
    obfuscate: false,
  )
  static final String backendBaseUrl = _Env.backendBaseUrl;

  @EnviedField(
    varName: 'THE_MOVIEDB_API_KEY',
    obfuscate: true,
  )
  static final String theMovieDbApiKey = _Env.theMovieDbApiKey;
}
