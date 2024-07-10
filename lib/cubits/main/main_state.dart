part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}


class LoadingGetProductsState extends MainState{}
class SuccessGetProductsState extends MainState{}
class ErrorGetProductsState extends MainState{}