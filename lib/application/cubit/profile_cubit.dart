import 'package:estado/core/utils/fake_user.dart';
import 'package:estado/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  void loadUser(String userId) {
    emit(const ProfileState.loading());
    final user = fakeUser.firstWhere((element) => element.id == userId);

    Future.delayed(const Duration(seconds: 2), () {
      emit(ProfileState.loaded(user));
    });
  }

  void updateUser({
    String? name,
    String? email,
    int? age,
    String? description,
  }) {
    final currentUser = state;

    if (currentUser is! ProfileLoadedState) {
      return;
    }

    try {
      emit(const ProfileState.loading());

      final updateUser = currentUser.user;

      final user = updateUser.copyWith(
        name: name ?? updateUser.name,
        email: email ?? updateUser.email,
        age: age ?? updateUser.age,
        description: description ?? updateUser.description,
      );
      emit(ProfileState.successUpdate());
      emit(ProfileState.loaded(user));
    } catch (e) {
      emit(ProfileState.error());
      emit(currentUser);
    }
  }
}
