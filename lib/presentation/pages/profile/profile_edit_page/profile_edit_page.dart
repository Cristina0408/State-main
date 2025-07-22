import 'package:estado/application/cubit/profile_cubit.dart';

import 'package:estado/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final ageController = TextEditingController();
    final descriptionController = TextEditingController();

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccessUpdateState) {
          context.pop();
          showSnackBar(context, "Se actualizo correctamente");
        }

        if (state is ProfileErrorState) {
          showSnackBar(context, "Ha ocurrido un error");
        }
      },
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final user = state.user;
          nameController.text = user.name;
          emailController.text = user.email;
          ageController.text = user.age.toString();
          descriptionController.text = user.description;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Editar Perfil'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Nuevo Nombre',
                    labelText: 'Nombre de Usuario',
                  ),
                  controller: nameController,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Edad',
                    labelText: 'Edad',
                  ),
                  controller: ageController,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Email',
                    labelText: 'Correo Electrónico',
                  ),
                  controller: emailController,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Habla de ti...',
                    labelText: 'Descripción',
                  ),
                  controller: descriptionController,
                ),

                ElevatedButton(
                  child: const Text('Guardar Cambios'),
                  onPressed: () {
                    final cubit = context.read<ProfileCubit>();
                    cubit.updateUser(
                      name: nameController.text,
                      email: emailController.text,
                      age: int.tryParse(ageController.text),
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
