// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllBuildHash() => r'bea10df5d4d8249e26a0a2ca357efb22bfaa8b9e';

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
String _$registerBuildHash() => r'04ac8df1fcb11a66c7e13e3458bbeda7a377a918';

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

String _$loginBuildHash() => r'da03614482465ca2f80047455e32231ac97f2b6f';

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
String _$carsByIdHash() => r'e2759d7e549ebcd78293a1aacc7d4e96a52bf77d';

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
String _$addCarsHash() => r'43ad7750099f2f7c8d1b6f86166824e25b5f81a2';

/// See also [addCars].
@ProviderFor(addCars)
const addCarsProvider = AddCarsFamily();

/// See also [addCars].
class AddCarsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [addCars].
  const AddCarsFamily();

  /// See also [addCars].
  AddCarsProvider call(
    String carNumber,
    bool isCar,
  ) {
    return AddCarsProvider(
      carNumber,
      isCar,
    );
  }

  @override
  AddCarsProvider getProviderOverride(
    covariant AddCarsProvider provider,
  ) {
    return call(
      provider.carNumber,
      provider.isCar,
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
  String? get name => r'addCarsProvider';
}

/// See also [addCars].
class AddCarsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [addCars].
  AddCarsProvider(
    String carNumber,
    bool isCar,
  ) : this._internal(
          (ref) => addCars(
            ref as AddCarsRef,
            carNumber,
            isCar,
          ),
          from: addCarsProvider,
          name: r'addCarsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCarsHash,
          dependencies: AddCarsFamily._dependencies,
          allTransitiveDependencies: AddCarsFamily._allTransitiveDependencies,
          carNumber: carNumber,
          isCar: isCar,
        );

  AddCarsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carNumber,
    required this.isCar,
  }) : super.internal();

  final String carNumber;
  final bool isCar;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(AddCarsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddCarsProvider._internal(
        (ref) => create(ref as AddCarsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        carNumber: carNumber,
        isCar: isCar,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _AddCarsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCarsProvider &&
        other.carNumber == carNumber &&
        other.isCar == isCar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carNumber.hashCode);
    hash = _SystemHash.combine(hash, isCar.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCarsRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `carNumber` of this provider.
  String get carNumber;

  /// The parameter `isCar` of this provider.
  bool get isCar;
}

class _AddCarsProviderElement extends AutoDisposeFutureProviderElement<dynamic>
    with AddCarsRef {
  _AddCarsProviderElement(super.provider);

  @override
  String get carNumber => (origin as AddCarsProvider).carNumber;
  @override
  bool get isCar => (origin as AddCarsProvider).isCar;
}

String _$removeCarsHash() => r'3c7cd6d68ca027b2ab4ffc06b2fb31595fc6baf3';

/// See also [removeCars].
@ProviderFor(removeCars)
const removeCarsProvider = RemoveCarsFamily();

/// See also [removeCars].
class RemoveCarsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [removeCars].
  const RemoveCarsFamily();

  /// See also [removeCars].
  RemoveCarsProvider call(
    String carId,
  ) {
    return RemoveCarsProvider(
      carId,
    );
  }

  @override
  RemoveCarsProvider getProviderOverride(
    covariant RemoveCarsProvider provider,
  ) {
    return call(
      provider.carId,
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
  String? get name => r'removeCarsProvider';
}

/// See also [removeCars].
class RemoveCarsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [removeCars].
  RemoveCarsProvider(
    String carId,
  ) : this._internal(
          (ref) => removeCars(
            ref as RemoveCarsRef,
            carId,
          ),
          from: removeCarsProvider,
          name: r'removeCarsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeCarsHash,
          dependencies: RemoveCarsFamily._dependencies,
          allTransitiveDependencies:
              RemoveCarsFamily._allTransitiveDependencies,
          carId: carId,
        );

  RemoveCarsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carId,
  }) : super.internal();

  final String carId;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(RemoveCarsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveCarsProvider._internal(
        (ref) => create(ref as RemoveCarsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        carId: carId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _RemoveCarsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveCarsProvider && other.carId == carId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveCarsRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `carId` of this provider.
  String get carId;
}

class _RemoveCarsProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with RemoveCarsRef {
  _RemoveCarsProviderElement(super.provider);

  @override
  String get carId => (origin as RemoveCarsProvider).carId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
