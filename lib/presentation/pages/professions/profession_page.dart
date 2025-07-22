import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/snack_bar.dart';
import 'cubit/profession_cubit.dart';
import 'cubit/profession_state.dart';

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
          context.pop();
          showSnackBar(context, "Se actualizó correctamente");
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Nueva Profesión',
                    labelText: 'Profesión',
                  ),
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Años',
                    labelText: '¿Cuántos años lleva en ese oficio?',
                  ),
                  controller: ageController,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Habla de ti...',
                    labelText: 'Descripción',
                  ),
                  controller: descriptionController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Guardar Cambios'),
                  onPressed: () {
                    final age = int.tryParse(ageController.text);
                    if (age == null) {
                      showSnackBar(context, "Por favor ingresa un número válido para los años");
                      return;
                    }

                    final cubit = context.read<ProfessionCubit>();
                    cubit.updateProfession(
                      name: nameController.text,
                      age: age,
                      description: descriptionController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
