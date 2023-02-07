//=================BASE===========================================

enum Env {
  local(code: 'LOCAL'),
  dev(code: 'DEV'),
  staging(code: 'STAGING'),
  prod(code: 'PROD'),
  ;

  final String code;

  const Env({
    required this.code,
  });
}

abstract class BaseConfig {
  String get mainUrl;
  String get pKey;
  Env get type;
}

class LocalConfig implements BaseConfig {
  @override
  String get mainUrl => "_";

  @override
  String get pKey => "key";

  @override
  Env get type => Env.local;
}

class DevConfig implements BaseConfig {
  @override
  String get mainUrl => "_";

  @override
  String get pKey => '_';

  @override
  Env get type => Env.dev;
}

class StagingConfig implements BaseConfig {
  @override
  String get mainUrl => "add link here";

  @override
  String get pKey => "key";

  @override
  Env get type => Env.staging;
}

class ProductConfig implements BaseConfig {
  @override
  String get mainUrl => "add link here";

  @override
  String get pKey => 'key';

  @override
  Env get type => Env.prod;
}

//=================CALLING=========================================

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String local = 'LOCAL';
  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String product = 'PROD';

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.product:
        return ProductConfig();
      case Environment.staging:
        return StagingConfig();
      case Environment.dev:
        return DevConfig();
      default:
        return LocalConfig();
    }
  }
}

//==========================================================
