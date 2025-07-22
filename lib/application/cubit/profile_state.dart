part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitialState;
  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded(User user) = ProfileLoadedState;
  const factory ProfileState.error() = ProfileErrorState;
  const factory ProfileState.empty() = ProfileEmptyState;
  const factory ProfileState.successUpdate() = ProfileSuccessUpdateState;
}



