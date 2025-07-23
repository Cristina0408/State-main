// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfessionState()';
}


}

/// @nodoc
class $ProfessionStateCopyWith<$Res>  {
$ProfessionStateCopyWith(ProfessionState _, $Res Function(ProfessionState) __);
}


/// Adds pattern-matching-related methods to [ProfessionState].
extension ProfessionStatePatterns on ProfessionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfessionInitialState value)?  initial,TResult Function( ProfessionLoadingState value)?  loading,TResult Function( ProfessionLoadedState value)?  loaded,TResult Function( ProfessionErrorState value)?  error,TResult Function( ProfessionSuccessUpdateState value)?  successUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfessionInitialState() when initial != null:
return initial(_that);case ProfessionLoadingState() when loading != null:
return loading(_that);case ProfessionLoadedState() when loaded != null:
return loaded(_that);case ProfessionErrorState() when error != null:
return error(_that);case ProfessionSuccessUpdateState() when successUpdate != null:
return successUpdate(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfessionInitialState value)  initial,required TResult Function( ProfessionLoadingState value)  loading,required TResult Function( ProfessionLoadedState value)  loaded,required TResult Function( ProfessionErrorState value)  error,required TResult Function( ProfessionSuccessUpdateState value)  successUpdate,}){
final _that = this;
switch (_that) {
case ProfessionInitialState():
return initial(_that);case ProfessionLoadingState():
return loading(_that);case ProfessionLoadedState():
return loaded(_that);case ProfessionErrorState():
return error(_that);case ProfessionSuccessUpdateState():
return successUpdate(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfessionInitialState value)?  initial,TResult? Function( ProfessionLoadingState value)?  loading,TResult? Function( ProfessionLoadedState value)?  loaded,TResult? Function( ProfessionErrorState value)?  error,TResult? Function( ProfessionSuccessUpdateState value)?  successUpdate,}){
final _that = this;
switch (_that) {
case ProfessionInitialState() when initial != null:
return initial(_that);case ProfessionLoadingState() when loading != null:
return loading(_that);case ProfessionLoadedState() when loaded != null:
return loaded(_that);case ProfessionErrorState() when error != null:
return error(_that);case ProfessionSuccessUpdateState() when successUpdate != null:
return successUpdate(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Profession> profession)?  loaded,TResult Function( String message)?  error,TResult Function()?  successUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfessionInitialState() when initial != null:
return initial();case ProfessionLoadingState() when loading != null:
return loading();case ProfessionLoadedState() when loaded != null:
return loaded(_that.profession);case ProfessionErrorState() when error != null:
return error(_that.message);case ProfessionSuccessUpdateState() when successUpdate != null:
return successUpdate();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Profession> profession)  loaded,required TResult Function( String message)  error,required TResult Function()  successUpdate,}) {final _that = this;
switch (_that) {
case ProfessionInitialState():
return initial();case ProfessionLoadingState():
return loading();case ProfessionLoadedState():
return loaded(_that.profession);case ProfessionErrorState():
return error(_that.message);case ProfessionSuccessUpdateState():
return successUpdate();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Profession> profession)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  successUpdate,}) {final _that = this;
switch (_that) {
case ProfessionInitialState() when initial != null:
return initial();case ProfessionLoadingState() when loading != null:
return loading();case ProfessionLoadedState() when loaded != null:
return loaded(_that.profession);case ProfessionErrorState() when error != null:
return error(_that.message);case ProfessionSuccessUpdateState() when successUpdate != null:
return successUpdate();case _:
  return null;

}
}

}

/// @nodoc


class ProfessionInitialState implements ProfessionState {
  const ProfessionInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfessionState.initial()';
}


}




/// @nodoc


class ProfessionLoadingState implements ProfessionState {
  const ProfessionLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfessionState.loading()';
}


}




/// @nodoc


class ProfessionLoadedState implements ProfessionState {
  const ProfessionLoadedState({required final  List<Profession> profession}): _profession = profession;
  

 final  List<Profession> _profession;
 List<Profession> get profession {
  if (_profession is EqualUnmodifiableListView) return _profession;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profession);
}


/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionLoadedStateCopyWith<ProfessionLoadedState> get copyWith => _$ProfessionLoadedStateCopyWithImpl<ProfessionLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionLoadedState&&const DeepCollectionEquality().equals(other._profession, _profession));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_profession));

@override
String toString() {
  return 'ProfessionState.loaded(profession: $profession)';
}


}

/// @nodoc
abstract mixin class $ProfessionLoadedStateCopyWith<$Res> implements $ProfessionStateCopyWith<$Res> {
  factory $ProfessionLoadedStateCopyWith(ProfessionLoadedState value, $Res Function(ProfessionLoadedState) _then) = _$ProfessionLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Profession> profession
});




}
/// @nodoc
class _$ProfessionLoadedStateCopyWithImpl<$Res>
    implements $ProfessionLoadedStateCopyWith<$Res> {
  _$ProfessionLoadedStateCopyWithImpl(this._self, this._then);

  final ProfessionLoadedState _self;
  final $Res Function(ProfessionLoadedState) _then;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profession = null,}) {
  return _then(ProfessionLoadedState(
profession: null == profession ? _self._profession : profession // ignore: cast_nullable_to_non_nullable
as List<Profession>,
  ));
}


}

/// @nodoc


class ProfessionErrorState implements ProfessionState {
  const ProfessionErrorState(this.message);
  

 final  String message;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionErrorStateCopyWith<ProfessionErrorState> get copyWith => _$ProfessionErrorStateCopyWithImpl<ProfessionErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfessionErrorStateCopyWith<$Res> implements $ProfessionStateCopyWith<$Res> {
  factory $ProfessionErrorStateCopyWith(ProfessionErrorState value, $Res Function(ProfessionErrorState) _then) = _$ProfessionErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProfessionErrorStateCopyWithImpl<$Res>
    implements $ProfessionErrorStateCopyWith<$Res> {
  _$ProfessionErrorStateCopyWithImpl(this._self, this._then);

  final ProfessionErrorState _self;
  final $Res Function(ProfessionErrorState) _then;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProfessionErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfessionSuccessUpdateState implements ProfessionState {
  const ProfessionSuccessUpdateState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionSuccessUpdateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfessionState.successUpdate()';
}


}




// dart format on
