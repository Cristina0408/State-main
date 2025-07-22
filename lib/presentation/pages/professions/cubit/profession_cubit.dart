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
  required String name,
  required int age,
  required String description,
}) {
  final currentState = state;

  if (currentState is! ProfessionLoadedState) return;

  final professionList = currentState.profession;

  if (professionList.isEmpty) {
    emit(const ProfessionState.error("No hay profesión para actualizar"));
    return;
  }

  try {
    emit(const ProfessionState.loading());

    final currentProfession = professionList.first;

    final updatedProfession = currentProfession.copyWith(
      name: name,
      age: age,
      description: description,
    );

    // 🔁 Actualiza directamente la lista fake global
    final index = fakeProfession.indexWhere((p) => p.id == currentProfession.id);
    if (index != -1) {
      fakeProfession[index] = updatedProfession;
    }

    emit(const ProfessionState.successUpdate());

    // 🔄 Recarga el estado con la nueva profesión
    emit(ProfessionState.loaded(profession: [updatedProfession]));
  } catch (e) {
    emit(const ProfessionState.error("Error actualizando profesión"));
    emit(currentState); // Recuperar el estado anterior en caso de error
  }
}

}

