import 'package:estado/presentation/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/profile_cubit/profile_cubit.dart';
import 'widget/profile_header.dart';
import 'widget/profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(this.userId, {super.key, required this.professionId});
  final String userId;
  final String professionId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    cubit.loadUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const SkeletonItem();
        } else if (state is ProfileLoadedState) {
          return Scaffold(
            appBar: AppBar(
              shadowColor: Colors.transparent,
              title: ProfileHeader(),
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfo(
                    onPressed: () => context.push('/profile/edit'),
                    text: 'Información General',
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('No se pudo cargar el perfil.'));
        }
      },
    );
  }
}
