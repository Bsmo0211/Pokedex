// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPokemonDetailHash() =>
    r'017eb324941514983a2318fc52d1c6bfcd92be8d';

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

/// See also [fetchPokemonDetail].
@ProviderFor(fetchPokemonDetail)
const fetchPokemonDetailProvider = FetchPokemonDetailFamily();

/// See also [fetchPokemonDetail].
class FetchPokemonDetailFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [fetchPokemonDetail].
  const FetchPokemonDetailFamily();

  /// See also [fetchPokemonDetail].
  FetchPokemonDetailProvider call(String pokemonName) {
    return FetchPokemonDetailProvider(pokemonName);
  }

  @override
  FetchPokemonDetailProvider getProviderOverride(
    covariant FetchPokemonDetailProvider provider,
  ) {
    return call(provider.pokemonName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPokemonDetailProvider';
}

/// See also [fetchPokemonDetail].
class FetchPokemonDetailProvider extends AutoDisposeFutureProvider<Pokemon> {
  /// See also [fetchPokemonDetail].
  FetchPokemonDetailProvider(String pokemonName)
    : this._internal(
        (ref) => fetchPokemonDetail(ref as FetchPokemonDetailRef, pokemonName),
        from: fetchPokemonDetailProvider,
        name: r'fetchPokemonDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$fetchPokemonDetailHash,
        dependencies: FetchPokemonDetailFamily._dependencies,
        allTransitiveDependencies:
            FetchPokemonDetailFamily._allTransitiveDependencies,
        pokemonName: pokemonName,
      );

  FetchPokemonDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonName,
  }) : super.internal();

  final String pokemonName;

  @override
  Override overrideWith(
    FutureOr<Pokemon> Function(FetchPokemonDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPokemonDetailProvider._internal(
        (ref) => create(ref as FetchPokemonDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonName: pokemonName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Pokemon> createElement() {
    return _FetchPokemonDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPokemonDetailProvider &&
        other.pokemonName == pokemonName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPokemonDetailRef on AutoDisposeFutureProviderRef<Pokemon> {
  /// The parameter `pokemonName` of this provider.
  String get pokemonName;
}

class _FetchPokemonDetailProviderElement
    extends AutoDisposeFutureProviderElement<Pokemon>
    with FetchPokemonDetailRef {
  _FetchPokemonDetailProviderElement(super.provider);

  @override
  String get pokemonName => (origin as FetchPokemonDetailProvider).pokemonName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
