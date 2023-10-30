// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countHash() => r'eedd098dbf3b530e2ed3cf34b09f97f93bef2648';

/// See also [count].
@ProviderFor(count)
final countProvider = AutoDisposeProvider<int>.internal(
  count,
  name: r'countProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountRef = AutoDisposeProviderRef<int>;
String _$getAllBuildHash() => r'a3f39835e86721a6c19cfe4ce0d7d3a56f3d9325';

/// See also [getAllBuild].
@ProviderFor(getAllBuild)
final getAllBuildProvider =
    AutoDisposeFutureProvider<List<BuildingModel>>.internal(
  getAllBuild,
  name: r'getAllBuildProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllBuildHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllBuildRef = AutoDisposeFutureProviderRef<List<BuildingModel>>;
String _$registerBuildHash() => r'1ca96b4eefc991c5d42462ccd5a1250d9bcfc14c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [registerBuild].
@ProviderFor(registerBuild)
const registerBuildProvider = RegisterBuildFamily();

/// See also [registerBuild].
class RegisterBuildFamily extends Family<AsyncValue<bool>> {
  /// See also [registerBuild].
  const RegisterBuildFamily();

  /// See also [registerBuild].
  RegisterBuildProvider call(
    String buildName,
    String password,
    BuildContext context,
  ) {
    return RegisterBuildProvider(
      buildName,
      password,
      context,
    );
  }

  @override
  RegisterBuildProvider getProviderOverride(
    covariant RegisterBuildProvider provider,
  ) {
    return call(
      provider.buildName,
      provider.password,
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerBuildProvider';
}

/// See also [registerBuild].
class RegisterBuildProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [registerBuild].
  RegisterBuildProvider(
    String buildName,
    String password,
    BuildContext context,
  ) : this._internal(
          (ref) => registerBuild(
            ref as RegisterBuildRef,
            buildName,
            password,
            context,
          ),
          from: registerBuildProvider,
          name: r'registerBuildProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerBuildHash,
          dependencies: RegisterBuildFamily._dependencies,
          allTransitiveDependencies:
              RegisterBuildFamily._allTransitiveDependencies,
          buildName: buildName,
          password: password,
          context: context,
        );

  RegisterBuildProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.buildName,
    required this.password,
    required this.context,
  }) : super.internal();

  final String buildName;
  final String password;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<bool> Function(RegisterBuildRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterBuildProvider._internal(
        (ref) => create(ref as RegisterBuildRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        buildName: buildName,
        password: password,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _RegisterBuildProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterBuildProvider &&
        other.buildName == buildName &&
        other.password == password &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, buildName.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterBuildRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `buildName` of this provider.
  String get buildName;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _RegisterBuildProviderElement
    extends AutoDisposeFutureProviderElement<bool> with RegisterBuildRef {
  _RegisterBuildProviderElement(super.provider);

  @override
  String get buildName => (origin as RegisterBuildProvider).buildName;
  @override
  String get password => (origin as RegisterBuildProvider).password;
  @override
  BuildContext get context => (origin as RegisterBuildProvider).context;
}

String _$loginBuildHash() => r'1648aae461570c14255b735fe3a820884d1ad4ed';

/// See also [loginBuild].
@ProviderFor(loginBuild)
const loginBuildProvider = LoginBuildFamily();

/// See also [loginBuild].
class LoginBuildFamily extends Family<AsyncValue<bool>> {
  /// See also [loginBuild].
  const LoginBuildFamily();

  /// See also [loginBuild].
  LoginBuildProvider call(
    String buildName,
    String password,
    BuildContext context,
  ) {
    return LoginBuildProvider(
      buildName,
      password,
      context,
    );
  }

  @override
  LoginBuildProvider getProviderOverride(
    covariant LoginBuildProvider provider,
  ) {
    return call(
      provider.buildName,
      provider.password,
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginBuildProvider';
}

/// See also [loginBuild].
class LoginBuildProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [loginBuild].
  LoginBuildProvider(
    String buildName,
    String password,
    BuildContext context,
  ) : this._internal(
          (ref) => loginBuild(
            ref as LoginBuildRef,
            buildName,
            password,
            context,
          ),
          from: loginBuildProvider,
          name: r'loginBuildProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginBuildHash,
          dependencies: LoginBuildFamily._dependencies,
          allTransitiveDependencies:
              LoginBuildFamily._allTransitiveDependencies,
          buildName: buildName,
          password: password,
          context: context,
        );

  LoginBuildProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.buildName,
    required this.password,
    required this.context,
  }) : super.internal();

  final String buildName;
  final String password;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<bool> Function(LoginBuildRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginBuildProvider._internal(
        (ref) => create(ref as LoginBuildRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        buildName: buildName,
        password: password,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _LoginBuildProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginBuildProvider &&
        other.buildName == buildName &&
        other.password == password &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, buildName.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginBuildRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `buildName` of this provider.
  String get buildName;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _LoginBuildProviderElement extends AutoDisposeFutureProviderElement<bool>
    with LoginBuildRef {
  _LoginBuildProviderElement(super.provider);

  @override
  String get buildName => (origin as LoginBuildProvider).buildName;
  @override
  String get password => (origin as LoginBuildProvider).password;
  @override
  BuildContext get context => (origin as LoginBuildProvider).context;
}

String _$logoutBuildHash() => r'3eb75387c52d7cad9e338b89ec3482af03655273';

/// See also [logoutBuild].
@ProviderFor(logoutBuild)
final logoutBuildProvider =
    AutoDisposeFutureProvider<Response<dynamic>>.internal(
  logoutBuild,
  name: r'logoutBuildProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logoutBuildHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogoutBuildRef = AutoDisposeFutureProviderRef<Response<dynamic>>;
String _$carsByIdHash() => r'755623fca1f50689235c3818d41504ca0d0f8aff';

/// See also [carsById].
@ProviderFor(carsById)
final carsByIdProvider = AutoDisposeFutureProvider<dynamic>.internal(
  carsById,
  name: r'carsByIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$carsByIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarsByIdRef = AutoDisposeFutureProviderRef<dynamic>;
String _$addCarsHash() => r'dfef9616bf61ee0355a753e0fbf14109ffcb00da';

/// See also [addCars].
@ProviderFor(addCars)
final addCarsProvider = AutoDisposeProvider<void>.internal(
  addCars,
  name: r'addCarsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addCarsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddCarsRef = AutoDisposeProviderRef<void>;
String _$removeCarsHash() => r'e1964ceb5fc6fbfa5a71d66870d54df7861adf16';

/// See also [removeCars].
@ProviderFor(removeCars)
final removeCarsProvider = AutoDisposeProvider<void>.internal(
  removeCars,
  name: r'removeCarsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$removeCarsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoveCarsRef = AutoDisposeProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
