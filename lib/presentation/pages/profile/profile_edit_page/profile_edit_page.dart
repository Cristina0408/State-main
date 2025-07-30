import 'dart:io';
import 'package:estado/application/profile_cubit/profile_cubit.dart';
import 'package:estado/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final descriptionController = TextEditingController();
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccessUpdateState) {
          context.pop();
          showSnackBar(context, "Se actualizó correctamente");
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
            title: const Text('Editar Perfil'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _pickedImage != null
                            ? FileImage(_pickedImage!)
                            : const AssetImage('assets/placeholder.png')
                                  as ImageProvider,
                        backgroundColor: Colors.grey[300],
                        child: _pickedImage == null
                            ? const Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.white70,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Nuevo Nombre',
                        labelText: 'Nombre de Usuario',
                      ),
                      controller: nameController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.emoji_people),
                        hintText: 'Edad',
                        labelText: 'Edad',
                      ),
                      controller: ageController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Email',
                        labelText: 'Correo Electrónico',
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.description),
                        hintText: 'Habla de ti...',
                        labelText: 'Descripción',
                      ),
                      controller: descriptionController,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      child: const Text('Guardar Cambios'),
                      onPressed: () {
                        final cubit = context.read<ProfileCubit>();
                        cubit.updateUser(
                          name: nameController.text,
                          email: emailController.text,
                          age: int.tryParse(ageController.text),
                          description: descriptionController.text,
                          profileImagePath: _pickedImage?.path,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }
}
