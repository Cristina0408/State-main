import 'package:estado/features/utils/fake_user.dart';
import 'package:estado/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profesion.dart';

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
    String? profileImagePath,
  }) {
    final currentUser = state;

    if (currentUser is! ProfileLoadedState) {
      return;
    }

      try {
    emit(const ProfileState.loading());

    final userBefore = currentUser.user;

    final updatedUser = userBefore.copyWith(
      name: name ?? userBefore.name,
      email: email ?? userBefore.email,
      age: age ?? userBefore.age,
      description: description ?? userBefore.description,
      profileImagePath: profileImagePath ?? userBefore.profileImagePath,
    );

    emit(const ProfileState.successUpdate());
    emit(ProfileState.loaded(updatedUser));
  } catch (e) {
    emit(const ProfileState.error());
    emit(currentUser);
  }
}
  void updateProfessions(List<Profession> newProfessions) {
    final currentState = state;
    if (currentState is! ProfileLoadedState) return;

    emit(const ProfileState.loading());

    final professionIds = newProfessions.map((p) => p.id).toList();

    final updatedUser = currentState.user.copyWith(
      professionsId: professionIds,
    );

    emit(ProfileState.successUpdate());
    emit(ProfileState.loaded(updatedUser));
  }
}
