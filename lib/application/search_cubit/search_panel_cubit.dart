import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPanelCubit extends Cubit<bool> {
  SearchPanelCubit() : super(false);

  void toggle() => emit(!state);

  void show() => emit(true);

  void hide() => emit(false);
}
