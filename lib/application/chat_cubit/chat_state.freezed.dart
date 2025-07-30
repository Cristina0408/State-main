// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {

 List<ChatMessageModel> get messages; String get currentInput; Map<String, String> get nicknames; Set<String> get favorites; Set<String> get loadingNicknames; Map<String, bool> get notificationsEnabled; String? get selectedContactId;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.currentInput, currentInput) || other.currentInput == currentInput)&&const DeepCollectionEquality().equals(other.nicknames, nicknames)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&const DeepCollectionEquality().equals(other.loadingNicknames, loadingNicknames)&&const DeepCollectionEquality().equals(other.notificationsEnabled, notificationsEnabled)&&(identical(other.selectedContactId, selectedContactId) || other.selectedContactId == selectedContactId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),currentInput,const DeepCollectionEquality().hash(nicknames),const DeepCollectionEquality().hash(favorites),const DeepCollectionEquality().hash(loadingNicknames),const DeepCollectionEquality().hash(notificationsEnabled),selectedContactId);

@override
String toString() {
  return 'ChatState(messages: $messages, currentInput: $currentInput, nicknames: $nicknames, favorites: $favorites, loadingNicknames: $loadingNicknames, notificationsEnabled: $notificationsEnabled, selectedContactId: $selectedContactId)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 List<ChatMessageModel> messages, String currentInput, Map<String, String> nicknames, Set<String> favorites, Set<String> loadingNicknames, Map<String, bool> notificationsEnabled, String? selectedContactId
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? currentInput = null,Object? nicknames = null,Object? favorites = null,Object? loadingNicknames = null,Object? notificationsEnabled = null,Object? selectedContactId = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,currentInput: null == currentInput ? _self.currentInput : currentInput // ignore: cast_nullable_to_non_nullable
as String,nicknames: null == nicknames ? _self.nicknames : nicknames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as Set<String>,loadingNicknames: null == loadingNicknames ? _self.loadingNicknames : loadingNicknames // ignore: cast_nullable_to_non_nullable
as Set<String>,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,selectedContactId: freezed == selectedContactId ? _self.selectedContactId : selectedContactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String currentInput,  Map<String, String> nicknames,  Set<String> favorites,  Set<String> loadingNicknames,  Map<String, bool> notificationsEnabled,  String? selectedContactId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.currentInput,_that.nicknames,_that.favorites,_that.loadingNicknames,_that.notificationsEnabled,_that.selectedContactId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String currentInput,  Map<String, String> nicknames,  Set<String> favorites,  Set<String> loadingNicknames,  Map<String, bool> notificationsEnabled,  String? selectedContactId)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.messages,_that.currentInput,_that.nicknames,_that.favorites,_that.loadingNicknames,_that.notificationsEnabled,_that.selectedContactId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessageModel> messages,  String currentInput,  Map<String, String> nicknames,  Set<String> favorites,  Set<String> loadingNicknames,  Map<String, bool> notificationsEnabled,  String? selectedContactId)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.currentInput,_that.nicknames,_that.favorites,_that.loadingNicknames,_that.notificationsEnabled,_that.selectedContactId);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({required final  List<ChatMessageModel> messages, required this.currentInput, required final  Map<String, String> nicknames, required final  Set<String> favorites, required final  Set<String> loadingNicknames, required final  Map<String, bool> notificationsEnabled, this.selectedContactId}): _messages = messages,_nicknames = nicknames,_favorites = favorites,_loadingNicknames = loadingNicknames,_notificationsEnabled = notificationsEnabled;
  

 final  List<ChatMessageModel> _messages;
@override List<ChatMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String currentInput;
 final  Map<String, String> _nicknames;
@override Map<String, String> get nicknames {
  if (_nicknames is EqualUnmodifiableMapView) return _nicknames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nicknames);
}

 final  Set<String> _favorites;
@override Set<String> get favorites {
  if (_favorites is EqualUnmodifiableSetView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favorites);
}

 final  Set<String> _loadingNicknames;
@override Set<String> get loadingNicknames {
  if (_loadingNicknames is EqualUnmodifiableSetView) return _loadingNicknames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_loadingNicknames);
}

 final  Map<String, bool> _notificationsEnabled;
@override Map<String, bool> get notificationsEnabled {
  if (_notificationsEnabled is EqualUnmodifiableMapView) return _notificationsEnabled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_notificationsEnabled);
}

@override final  String? selectedContactId;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.currentInput, currentInput) || other.currentInput == currentInput)&&const DeepCollectionEquality().equals(other._nicknames, _nicknames)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&const DeepCollectionEquality().equals(other._loadingNicknames, _loadingNicknames)&&const DeepCollectionEquality().equals(other._notificationsEnabled, _notificationsEnabled)&&(identical(other.selectedContactId, selectedContactId) || other.selectedContactId == selectedContactId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),currentInput,const DeepCollectionEquality().hash(_nicknames),const DeepCollectionEquality().hash(_favorites),const DeepCollectionEquality().hash(_loadingNicknames),const DeepCollectionEquality().hash(_notificationsEnabled),selectedContactId);

@override
String toString() {
  return 'ChatState(messages: $messages, currentInput: $currentInput, nicknames: $nicknames, favorites: $favorites, loadingNicknames: $loadingNicknames, notificationsEnabled: $notificationsEnabled, selectedContactId: $selectedContactId)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessageModel> messages, String currentInput, Map<String, String> nicknames, Set<String> favorites, Set<String> loadingNicknames, Map<String, bool> notificationsEnabled, String? selectedContactId
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? currentInput = null,Object? nicknames = null,Object? favorites = null,Object? loadingNicknames = null,Object? notificationsEnabled = null,Object? selectedContactId = freezed,}) {
  return _then(_ChatState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,currentInput: null == currentInput ? _self.currentInput : currentInput // ignore: cast_nullable_to_non_nullable
as String,nicknames: null == nicknames ? _self._nicknames : nicknames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as Set<String>,loadingNicknames: null == loadingNicknames ? _self._loadingNicknames : loadingNicknames // ignore: cast_nullable_to_non_nullable
as Set<String>,notificationsEnabled: null == notificationsEnabled ? _self._notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,selectedContactId: freezed == selectedContactId ? _self.selectedContactId : selectedContactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
