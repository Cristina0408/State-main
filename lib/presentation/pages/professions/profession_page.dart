import 'package:estado/presentation/pages/professions/widget/new_profession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/snack_bar.dart';
import '../../../application/profession_cubit/profession_cubit.dart';
import '../../../application/profession_cubit/profession_state.dart';

class ProfessionPage extends StatelessWidget {
  const ProfessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final descriptionController = TextEditingController();

    return BlocConsumer<ProfessionCubit, ProfessionState>(
      listener: (context, state) {
        if (state is ProfessionSuccessUpdateState) {
          showSnackBar(context, "Se actualizó correctamente");
          context.pop(true);
        }

        if (state is ProfessionErrorState) {
          showSnackBar(context, "Ha ocurrido un error");
        }
      },
      builder: (context, state) {
        if (state is ProfessionLoadedState && state.profession.isNotEmpty) {
          final profession = state.profession.first;
          nameController.text = profession.name;
          ageController.text = profession.age.toString();
          descriptionController.text = profession.description;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar Profesiones'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: NewProfession(),
        );
      },
    );
  }
}
