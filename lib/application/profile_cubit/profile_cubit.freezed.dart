// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileInitialState value)?  initial,TResult Function( ProfileLoadingState value)?  loading,TResult Function( ProfileLoadedState value)?  loaded,TResult Function( ProfileErrorState value)?  error,TResult Function( ProfileEmptyState value)?  empty,TResult Function( ProfileSuccessUpdateState value)?  successUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial(_that);case ProfileLoadingState() when loading != null:
return loading(_that);case ProfileLoadedState() when loaded != null:
return loaded(_that);case ProfileErrorState() when error != null:
return error(_that);case ProfileEmptyState() when empty != null:
return empty(_that);case ProfileSuccessUpdateState() when successUpdate != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileInitialState value)  initial,required TResult Function( ProfileLoadingState value)  loading,required TResult Function( ProfileLoadedState value)  loaded,required TResult Function( ProfileErrorState value)  error,required TResult Function( ProfileEmptyState value)  empty,required TResult Function( ProfileSuccessUpdateState value)  successUpdate,}){
final _that = this;
switch (_that) {
case ProfileInitialState():
return initial(_that);case ProfileLoadingState():
return loading(_that);case ProfileLoadedState():
return loaded(_that);case ProfileErrorState():
return error(_that);case ProfileEmptyState():
return empty(_that);case ProfileSuccessUpdateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileInitialState value)?  initial,TResult? Function( ProfileLoadingState value)?  loading,TResult? Function( ProfileLoadedState value)?  loaded,TResult? Function( ProfileErrorState value)?  error,TResult? Function( ProfileEmptyState value)?  empty,TResult? Function( ProfileSuccessUpdateState value)?  successUpdate,}){
final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial(_that);case ProfileLoadingState() when loading != null:
return loading(_that);case ProfileLoadedState() when loaded != null:
return loaded(_that);case ProfileErrorState() when error != null:
return error(_that);case ProfileEmptyState() when empty != null:
return empty(_that);case ProfileSuccessUpdateState() when successUpdate != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  loaded,TResult Function()?  error,TResult Function()?  empty,TResult Function()?  successUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial();case ProfileLoadingState() when loading != null:
return loading();case ProfileLoadedState() when loaded != null:
return loaded(_that.user);case ProfileErrorState() when error != null:
return error();case ProfileEmptyState() when empty != null:
return empty();case ProfileSuccessUpdateState() when successUpdate != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  loaded,required TResult Function()  error,required TResult Function()  empty,required TResult Function()  successUpdate,}) {final _that = this;
switch (_that) {
case ProfileInitialState():
return initial();case ProfileLoadingState():
return loading();case ProfileLoadedState():
return loaded(_that.user);case ProfileErrorState():
return error();case ProfileEmptyState():
return empty();case ProfileSuccessUpdateState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  loaded,TResult? Function()?  error,TResult? Function()?  empty,TResult? Function()?  successUpdate,}) {final _that = this;
switch (_that) {
case ProfileInitialState() when initial != null:
return initial();case ProfileLoadingState() when loading != null:
return loading();case ProfileLoadedState() when loaded != null:
return loaded(_that.user);case ProfileErrorState() when error != null:
return error();case ProfileEmptyState() when empty != null:
return empty();case ProfileSuccessUpdateState() when successUpdate != null:
return successUpdate();case _:
  return null;

}
}

}

/// @nodoc


class ProfileInitialState implements ProfileState {
  const ProfileInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class ProfileLoadingState implements ProfileState {
  const ProfileLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class ProfileLoadedState implements ProfileState {
  const ProfileLoadedState(this.user);
  

 final  User user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileLoadedStateCopyWith<ProfileLoadedState> get copyWith => _$ProfileLoadedStateCopyWithImpl<ProfileLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoadedState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileLoadedStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileLoadedStateCopyWith(ProfileLoadedState value, $Res Function(ProfileLoadedState) _then) = _$ProfileLoadedStateCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$ProfileLoadedStateCopyWithImpl<$Res>
    implements $ProfileLoadedStateCopyWith<$Res> {
  _$ProfileLoadedStateCopyWithImpl(this._self, this._then);

  final ProfileLoadedState _self;
  final $Res Function(ProfileLoadedState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(ProfileLoadedState(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class ProfileErrorState implements ProfileState {
  const ProfileErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.error()';
}


}




/// @nodoc


class ProfileEmptyState implements ProfileState {
  const ProfileEmptyState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEmptyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.empty()';
}


}




/// @nodoc


class ProfileSuccessUpdateState implements ProfileState {
  const ProfileSuccessUpdateState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSuccessUpdateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.successUpdate()';
}


}




// dart format on
