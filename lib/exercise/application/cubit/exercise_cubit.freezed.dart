// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExerciseState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ExerciseModel? get user => throw _privateConstructorUsedError;
  List<int> get selectedOption => throw _privateConstructorUsedError;
  int get selectedCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseStateCopyWith<ExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStateCopyWith<$Res> {
  factory $ExerciseStateCopyWith(
          ExerciseState value, $Res Function(ExerciseState) then) =
      _$ExerciseStateCopyWithImpl<$Res, ExerciseState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      ExerciseModel? user,
      List<int> selectedOption,
      int selectedCount});
}

/// @nodoc
class _$ExerciseStateCopyWithImpl<$Res, $Val extends ExerciseState>
    implements $ExerciseStateCopyWith<$Res> {
  _$ExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? user = freezed,
    Object? selectedOption = null,
    Object? selectedCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ExerciseModel?,
      selectedOption: null == selectedOption
          ? _value.selectedOption
          : selectedOption // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$userImplCopyWith<$Res>
    implements $ExerciseStateCopyWith<$Res> {
  factory _$$userImplCopyWith(
          _$userImpl value, $Res Function(_$userImpl) then) =
      __$$userImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      ExerciseModel? user,
      List<int> selectedOption,
      int selectedCount});
}

/// @nodoc
class __$$userImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$userImpl>
    implements _$$userImplCopyWith<$Res> {
  __$$userImplCopyWithImpl(_$userImpl _value, $Res Function(_$userImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? user = freezed,
    Object? selectedOption = null,
    Object? selectedCount = null,
  }) {
    return _then(_$userImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ExerciseModel?,
      selectedOption: null == selectedOption
          ? _value._selectedOption
          : selectedOption // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$userImpl implements _user {
  const _$userImpl(
      {this.isLoading = false,
      this.error,
      this.user,
      final List<int> selectedOption = const [],
      this.selectedCount = 0})
      : _selectedOption = selectedOption;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final ExerciseModel? user;
  final List<int> _selectedOption;
  @override
  @JsonKey()
  List<int> get selectedOption {
    if (_selectedOption is EqualUnmodifiableListView) return _selectedOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedOption);
  }

  @override
  @JsonKey()
  final int selectedCount;

  @override
  String toString() {
    return 'ExerciseState(isLoading: $isLoading, error: $error, user: $user, selectedOption: $selectedOption, selectedCount: $selectedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$userImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._selectedOption, _selectedOption) &&
            (identical(other.selectedCount, selectedCount) ||
                other.selectedCount == selectedCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, user,
      const DeepCollectionEquality().hash(_selectedOption), selectedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$userImplCopyWith<_$userImpl> get copyWith =>
      __$$userImplCopyWithImpl<_$userImpl>(this, _$identity);
}

abstract class _user implements ExerciseState {
  const factory _user(
      {final bool isLoading,
      final String? error,
      final ExerciseModel? user,
      final List<int> selectedOption,
      final int selectedCount}) = _$userImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  ExerciseModel? get user;
  @override
  List<int> get selectedOption;
  @override
  int get selectedCount;
  @override
  @JsonKey(ignore: true)
  _$$userImplCopyWith<_$userImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
