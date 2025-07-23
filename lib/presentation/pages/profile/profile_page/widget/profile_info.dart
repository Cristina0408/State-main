import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/profile_cubit/profile_cubit.dart';
import '../../../../../domain/entities/profesion.dart';
import '../../../../../user_helper.dart';
import 'profile_list_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.onPressed, required this.text});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final user = state.user;
          final professions = getUserProfessions(user);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                  ),
                ),
                ProfileListTile(label: 'Nombre', value: user.name),
                ProfileListTile(label: 'Edad', value: user.age.toString()),
                ProfileListTile(label: 'Email', value: user.email),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final profileCubit = context.read<ProfileCubit>();
                          final result = await context.push<List<Profession>>(
                            '/profession/${user.id}',
                          );

                          if (result != null) {
                            profileCubit.updateProfessions(result);
                          }
                        },
                        child: Text(
                          'Editar Profesiones',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      ...professions.map(
                        (profession) => ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(horizontal: 5),
                          leading: const Icon(Icons.work, size: 20),
                          title: Text(
                            profession.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Años: ${profession.age}'), 
                                  Text('Descripción: ${profession.description}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ProfileListTile(label: 'Descripción', value: user.description),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
