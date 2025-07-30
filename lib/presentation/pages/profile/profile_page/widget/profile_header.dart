import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/profile_cubit/profile_cubit.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final user = state.user;
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(user.name, style: TextStyle(fontSize: 17)),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[300],
                backgroundImage: const NetworkImage(
                  'https://i.pravatar.cc/150',
                ),
                onBackgroundImageError: (error, stackTrace) {},
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/cubit/profile_cubit.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final user = state.user;
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(user.name, style: TextStyle(fontSize: 17)),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[300],
                backgroundImage: const NetworkImage(
                  'https://i.pravatar.cc/150',
                ),
                onBackgroundImageError: (error, stackTrace) {},
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
