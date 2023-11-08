import 'package:envied/envied.dart';

part 'env.g.dart';

/// Here the env data comes from the root project's .env file
/// So, I need to declare the path as '.env'
/// Don't forget to generate 'env.g.dart' file

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
