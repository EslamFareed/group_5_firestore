import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_5_firestore/cubits/main/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit.get(context).getProducts();

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        title: const Text("Home"),
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is LoadingGetProductsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessGetProductsState) {
            var list = MainCubit.get(context).products;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(list[index]["name"]),
                    subtitle: Text("${list[index]["price"]}"),
                  ),
                );
              },
              itemCount: list.length,
            );
          } else if (state is ErrorGetProductsState) {
            return const Center(child: Text("Error in getting products"));
          }

          return Container();
        },
      ),
    );
  }
}
