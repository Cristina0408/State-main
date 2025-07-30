import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../application/profile_cubit/profile_cubit.dart';
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
