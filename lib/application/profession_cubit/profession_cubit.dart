import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/utils/fake_profession.dart';
import '../../domain/entities/profesion.dart';
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

  void updateProfession({String? name, int? age, String? description}) {
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

      final index = fakeProfession.indexWhere(
        (p) => p.id == currentProfession.id,
      );
      if (index != -1) {
        fakeProfession[index] = updatedProfession;
      }

      emit(const ProfessionState.successUpdate());

      emit(ProfessionState.loaded(profession: [updatedProfession]));
    } catch (e) {
      emit(const ProfessionState.error("Error actualizando profesión"));
      emit(currentState);
    }
  }

  void addProfession({
    required String name,
    required int age,
    required String description,
  }) {
    final currentState = state;

    List<Profession> currentList = [];

    if (currentState is ProfessionLoadedState) {
      currentList = List.from(currentState.profession);
    }

    final newProfession = Profession(
      id: 'p${fakeProfession.length + currentList.length + 100}',
      name: name,
      age: age,
      description: description,
    );

    currentList.add(newProfession);
    fakeProfession.add(
      newProfession,
    ); 

    emit(ProfessionState.loaded(profession: currentList));
  }

    void removeProfession(Profession profession) {
    final currentState = state;
    if (currentState is! ProfessionLoadedState) return;

    final updatedList = List<Profession>.from(currentState.profession)
      ..removeWhere((p) => p.id == profession.id);

    fakeProfession.removeWhere((p) => p.id == profession.id); 

    emit(ProfessionState.loaded(profession: updatedList));
  }
}

