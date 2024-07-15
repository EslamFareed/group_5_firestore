import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_5_firestore/cubits/profile/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is LoadingUploadImageState) {
                  return const Center(child: CircularProgressIndicator());
                }
                var image = ProfileCubit.get(context).imageUrl;
                if (image == null) {
                  return const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg"),
                  );
                }
                return CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(image),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                ProfileCubit.get(context).uploadImage();
              },
              child: const Text("Choose Image"),
            ),
          ],
        ),
      ),
    );
  }
}
