import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var data = await firestore
                  .collection("product")
                  .where("price", isGreaterThan: 500)
                  .get();

              for (var element in data.docs) {
                print(element.data());
                print(element.id);
              }
            },
            child: Text("Get All"),
          ),
          ElevatedButton(
            onPressed: () async {
              var data = await firestore.collection("product").doc("1").get();

              print(data.id);
              print(data.data());
            },
            child: Text("Get One Item"),
          ),
          ElevatedButton(
            onPressed: () async {
              await firestore.collection("category").add({"name": "Laptops"});
              // .add({"name": "Laptop", "price": 500});
            },
            child: Text("Add"),
          ),
          ElevatedButton(
            onPressed: () async {
              await firestore.collection("product").doc("1").delete();
            },
            child: Text("Delete"),
          ),
          ElevatedButton(
            onPressed: () async {
              // await firestore.collection("product")
              // .doc("2")
              // .set({});

              await firestore
                  .collection("product")
                  .doc("2")
                  .update({"price": 1000, "inStock": true});
            },
            child: Text("Edit"),
          )
        ],
      ),
    );
  }
}
