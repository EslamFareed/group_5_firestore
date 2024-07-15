import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? name;
  double? price;
  String? id;

  ProductModel({this.name, this.price, this.id});

  ProductModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    id = doc.id;
    name = doc.data()["name"];
    price = double.parse(doc.data()["price"].toString());
  }
}
