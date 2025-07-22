import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/profesion.dart';

part 'profession_state.freezed.dart';

@freezed
class ProfessionState with _$ProfessionState {
  const factory ProfessionState.initial() = ProfessionInitialState;
  const factory ProfessionState.loading() = ProfessionLoadingState;
  const factory ProfessionState.loaded({required List<Profession> profession}) = ProfessionLoadedState;
  const factory ProfessionState.error(String message) = ProfessionErrorState;
  const factory ProfessionState.successUpdate() = ProfessionSuccessUpdateState;
}

