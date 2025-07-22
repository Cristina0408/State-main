import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/fake_profession.dart';
import 'profession_state.dart';

class ProfessionCubit extends Cubit<ProfessionState> {
  ProfessionCubit() : super(const ProfessionState.initial());

  void loadUser(String professionId) {
    emit(const ProfessionState.loading());

    final profession = fakeProfession
        .where((element) => element.id == professionId)
        .toList();

    Future.delayed(const Duration(seconds: 2), () {
      emit(ProfessionState.loaded(profession: profession));
    });
  }

  void updateProfession({
    String? name,
    int? age,
    String? description,
  }) {
    final currentState = state;

    if (currentState is! ProfessionLoadedState) {
      return;
    }

    try {
      emit(const ProfessionState.loading());

      final professionList = currentState.profession;

      if (professionList.isEmpty) {
        emit(const ProfessionState.error("No hay profesión para actualizar"));
        return;
      }

      final updatedProfession = professionList.first.copyWith(
        name: name ?? professionList.first.name,
        age: age ?? professionList.first.age,
        description: description ?? professionList.first.description,
      );

      final updatedList = [updatedProfession, ...professionList.skip(1)];

      emit(const ProfessionState.successUpdate());
      emit(ProfessionState.loaded(profession: updatedList));
    } catch (e) {
      emit(ProfessionState.error("Error actualizando profesión"));
      emit(currentState);
    }
  }
}

