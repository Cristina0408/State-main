import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/snack_bar.dart';
import '../../../../application/profession_cubit/profession_cubit.dart';
import '../../../../application/profession_cubit/profession_state.dart';

class NewProfession extends StatelessWidget {
  NewProfession({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final descriptionController = TextEditingController();

  void _handleSave(BuildContext context) {
    final name = nameController.text.trim();
    final age = int.tryParse(ageController.text.trim());
    final description = descriptionController.text.trim();

    if (name.isEmpty || age == null || description.isEmpty) {
      showSnackBar(context, "Por favor completa todos los campos correctamente");
      return;
    }

    context.read<ProfessionCubit>().addProfession(
          name: name,
          age: age,
          description: description,
        );

    nameController.clear();
    ageController.clear();
    descriptionController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionCubit, ProfessionState>(
      builder: (context, state) {
        final professionList = state is ProfessionLoadedState ? state.profession : [];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Nueva Profesión',
                        labelText: 'Profesión',
                      ),
                      controller: nameController,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: 'Años',
                        labelText: '¿Cuántos años?',
                      ),
                      controller: ageController,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.description),
                        hintText: 'Habla de ti...',
                        labelText: 'Descripción',
                      ),
                      controller: descriptionController,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _handleSave(context),
                    icon: const Icon(Icons.check),
                    label: const Text('Agregar'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: professionList.length,
                itemBuilder: (context, index) {
                  final p = professionList[index];
                return Dismissible(
                    key: Key(p.id),
                    direction: DismissDirection.startToEnd, 
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      context.read<ProfessionCubit>().removeProfession(p);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${p.name} eliminada'), duration: Duration(seconds: 1),),
                      );
                    },
                    child: ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(p.name),
                      subtitle: Text('${p.age} años — ${p.description}'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
                child: const Text('Guardar cambios'),
                onPressed: () {
                  final professionList = context.read<ProfessionCubit>().state is ProfessionLoadedState
                      ? (context.read<ProfessionCubit>().state as ProfessionLoadedState).profession
                      : [];
                  context.pop(professionList); 
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
