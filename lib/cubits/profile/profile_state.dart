part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


class ImageChosenState extends ProfileState{}


class LoadingUploadImageState extends ProfileState{}
class SuccessUploadImageState extends ProfileState{}
class ErrorUploadImageState extends ProfileState{}