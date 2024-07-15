import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  // XFile? image;

  // void chooseImage() async {
  //   image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   emit(ImageChosenState());
  // }

  String? imageUrl;

  final storage = FirebaseStorage.instance;

  void uploadImage() async {
    emit(LoadingUploadImageState());
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      var ref = storage.ref();
      var child = ref.child("/images/${image.name}");

      try {
        await child.putFile(File(image.path));

        imageUrl = await child.getDownloadURL();
        emit(SuccessUploadImageState());
      } catch (e) {
        print(e.toString());
        emit(ErrorUploadImageState());
      }
    } else {
      emit(ErrorUploadImageState());
    }
  }
}
