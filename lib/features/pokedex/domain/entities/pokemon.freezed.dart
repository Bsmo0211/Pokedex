// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  List<String> get abilitiesEn => throw _privateConstructorUsedError;
  List<String> get abilitiesEs => throw _privateConstructorUsedError;
  String get descriptionEn => throw _privateConstructorUsedError;
  String get descriptionEs => throw _privateConstructorUsedError;
  List<String> get weaknesses => throw _privateConstructorUsedError;
  String get categoryEn => throw _privateConstructorUsedError;
  String get categoryEs => throw _privateConstructorUsedError;
  double get malePercentage => throw _privateConstructorUsedError;
  double get femalePercentage => throw _privateConstructorUsedError;
  bool get isGenderless => throw _privateConstructorUsedError;

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call({
    int id,
    String name,
    String imageUrl,
    List<String> types,
    int weight,
    int height,
    List<String> abilitiesEn,
    List<String> abilitiesEs,
    String descriptionEn,
    String descriptionEs,
    List<String> weaknesses,
    String categoryEn,
    String categoryEs,
    double malePercentage,
    double femalePercentage,
    bool isGenderless,
  });
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? types = null,
    Object? weight = null,
    Object? height = null,
    Object? abilitiesEn = null,
    Object? abilitiesEs = null,
    Object? descriptionEn = null,
    Object? descriptionEs = null,
    Object? weaknesses = null,
    Object? categoryEn = null,
    Object? categoryEs = null,
    Object? malePercentage = null,
    Object? femalePercentage = null,
    Object? isGenderless = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            types: null == types
                ? _value.types
                : types // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            abilitiesEn: null == abilitiesEn
                ? _value.abilitiesEn
                : abilitiesEn // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            abilitiesEs: null == abilitiesEs
                ? _value.abilitiesEs
                : abilitiesEs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            descriptionEn: null == descriptionEn
                ? _value.descriptionEn
                : descriptionEn // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionEs: null == descriptionEs
                ? _value.descriptionEs
                : descriptionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            weaknesses: null == weaknesses
                ? _value.weaknesses
                : weaknesses // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            categoryEn: null == categoryEn
                ? _value.categoryEn
                : categoryEn // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryEs: null == categoryEs
                ? _value.categoryEs
                : categoryEs // ignore: cast_nullable_to_non_nullable
                      as String,
            malePercentage: null == malePercentage
                ? _value.malePercentage
                : malePercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            femalePercentage: null == femalePercentage
                ? _value.femalePercentage
                : femalePercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            isGenderless: null == isGenderless
                ? _value.isGenderless
                : isGenderless // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
    _$PokemonImpl value,
    $Res Function(_$PokemonImpl) then,
  ) = __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String imageUrl,
    List<String> types,
    int weight,
    int height,
    List<String> abilitiesEn,
    List<String> abilitiesEs,
    String descriptionEn,
    String descriptionEs,
    List<String> weaknesses,
    String categoryEn,
    String categoryEs,
    double malePercentage,
    double femalePercentage,
    bool isGenderless,
  });
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
    _$PokemonImpl _value,
    $Res Function(_$PokemonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? types = null,
    Object? weight = null,
    Object? height = null,
    Object? abilitiesEn = null,
    Object? abilitiesEs = null,
    Object? descriptionEn = null,
    Object? descriptionEs = null,
    Object? weaknesses = null,
    Object? categoryEn = null,
    Object? categoryEs = null,
    Object? malePercentage = null,
    Object? femalePercentage = null,
    Object? isGenderless = null,
  }) {
    return _then(
      _$PokemonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        types: null == types
            ? _value._types
            : types // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        abilitiesEn: null == abilitiesEn
            ? _value._abilitiesEn
            : abilitiesEn // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        abilitiesEs: null == abilitiesEs
            ? _value._abilitiesEs
            : abilitiesEs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        descriptionEn: null == descriptionEn
            ? _value.descriptionEn
            : descriptionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEs: null == descriptionEs
            ? _value.descriptionEs
            : descriptionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        weaknesses: null == weaknesses
            ? _value._weaknesses
            : weaknesses // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryEn: null == categoryEn
            ? _value.categoryEn
            : categoryEn // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryEs: null == categoryEs
            ? _value.categoryEs
            : categoryEs // ignore: cast_nullable_to_non_nullable
                  as String,
        malePercentage: null == malePercentage
            ? _value.malePercentage
            : malePercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        femalePercentage: null == femalePercentage
            ? _value.femalePercentage
            : femalePercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        isGenderless: null == isGenderless
            ? _value.isGenderless
            : isGenderless // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl extends _Pokemon {
  const _$PokemonImpl({
    required this.id,
    required this.name,
    required this.imageUrl,
    required final List<String> types,
    required this.weight,
    required this.height,
    final List<String> abilitiesEn = const [],
    final List<String> abilitiesEs = const [],
    this.descriptionEn = '',
    this.descriptionEs = '',
    final List<String> weaknesses = const [],
    this.categoryEn = '',
    this.categoryEs = '',
    this.malePercentage = 0.0,
    this.femalePercentage = 0.0,
    this.isGenderless = false,
  }) : _types = types,
       _abilitiesEn = abilitiesEn,
       _abilitiesEs = abilitiesEs,
       _weaknesses = weaknesses,
       super._();

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final int weight;
  @override
  final int height;
  final List<String> _abilitiesEn;
  @override
  @JsonKey()
  List<String> get abilitiesEn {
    if (_abilitiesEn is EqualUnmodifiableListView) return _abilitiesEn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilitiesEn);
  }

  final List<String> _abilitiesEs;
  @override
  @JsonKey()
  List<String> get abilitiesEs {
    if (_abilitiesEs is EqualUnmodifiableListView) return _abilitiesEs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilitiesEs);
  }

  @override
  @JsonKey()
  final String descriptionEn;
  @override
  @JsonKey()
  final String descriptionEs;
  final List<String> _weaknesses;
  @override
  @JsonKey()
  List<String> get weaknesses {
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weaknesses);
  }

  @override
  @JsonKey()
  final String categoryEn;
  @override
  @JsonKey()
  final String categoryEs;
  @override
  @JsonKey()
  final double malePercentage;
  @override
  @JsonKey()
  final double femalePercentage;
  @override
  @JsonKey()
  final bool isGenderless;

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, imageUrl: $imageUrl, types: $types, weight: $weight, height: $height, abilitiesEn: $abilitiesEn, abilitiesEs: $abilitiesEs, descriptionEn: $descriptionEn, descriptionEs: $descriptionEs, weaknesses: $weaknesses, categoryEn: $categoryEn, categoryEs: $categoryEs, malePercentage: $malePercentage, femalePercentage: $femalePercentage, isGenderless: $isGenderless)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(
              other._abilitiesEn,
              _abilitiesEn,
            ) &&
            const DeepCollectionEquality().equals(
              other._abilitiesEs,
              _abilitiesEs,
            ) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionEs, descriptionEs) ||
                other.descriptionEs == descriptionEs) &&
            const DeepCollectionEquality().equals(
              other._weaknesses,
              _weaknesses,
            ) &&
            (identical(other.categoryEn, categoryEn) ||
                other.categoryEn == categoryEn) &&
            (identical(other.categoryEs, categoryEs) ||
                other.categoryEs == categoryEs) &&
            (identical(other.malePercentage, malePercentage) ||
                other.malePercentage == malePercentage) &&
            (identical(other.femalePercentage, femalePercentage) ||
                other.femalePercentage == femalePercentage) &&
            (identical(other.isGenderless, isGenderless) ||
                other.isGenderless == isGenderless));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    imageUrl,
    const DeepCollectionEquality().hash(_types),
    weight,
    height,
    const DeepCollectionEquality().hash(_abilitiesEn),
    const DeepCollectionEquality().hash(_abilitiesEs),
    descriptionEn,
    descriptionEs,
    const DeepCollectionEquality().hash(_weaknesses),
    categoryEn,
    categoryEs,
    malePercentage,
    femalePercentage,
    isGenderless,
  );

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(this);
  }
}

abstract class _Pokemon extends Pokemon {
  const factory _Pokemon({
    required final int id,
    required final String name,
    required final String imageUrl,
    required final List<String> types,
    required final int weight,
    required final int height,
    final List<String> abilitiesEn,
    final List<String> abilitiesEs,
    final String descriptionEn,
    final String descriptionEs,
    final List<String> weaknesses,
    final String categoryEn,
    final String categoryEs,
    final double malePercentage,
    final double femalePercentage,
    final bool isGenderless,
  }) = _$PokemonImpl;
  const _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  List<String> get types;
  @override
  int get weight;
  @override
  int get height;
  @override
  List<String> get abilitiesEn;
  @override
  List<String> get abilitiesEs;
  @override
  String get descriptionEn;
  @override
  String get descriptionEs;
  @override
  List<String> get weaknesses;
  @override
  String get categoryEn;
  @override
  String get categoryEs;
  @override
  double get malePercentage;
  @override
  double get femalePercentage;
  @override
  bool get isGenderless;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
