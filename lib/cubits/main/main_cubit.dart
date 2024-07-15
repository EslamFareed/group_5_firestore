import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_5_firestore/models/product_model.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  // List<Map<String, dynamic>> products = [];
  List<ProductModel> products = [];

  void getProducts() async {
    emit(LoadingGetProductsState());
    try {
      // var data = await firestore.collection("product").get();
      // products = data.docs.map((e) => ProductModel.fromDoc(e)).toList();

      firestore.collection("product").snapshots().listen((event) {
        products = event.docs.map((e) => ProductModel.fromDoc(e)).toList();
        emit(SuccessGetProductsState());
      });
      emit(SuccessGetProductsState());
    } catch (e) {
      emit(ErrorGetProductsState());
      print(e.toString());
    }
  }
}
