import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/controllers/productsController.dart';
import 'package:front_paye_ton_kawa/models/products.dart';
import 'package:front_paye_ton_kawa/modules/produits/views/indexProduct.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutProductList extends HookConsumerWidget {
  const LayoutProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsController = ProductsController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<Products>>(
              future: productsController.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Erreur lors du chargement des produits.");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Le tableau vide");
                } else {
                  final listProducts = snapshot.data!;
                  return ListView.builder(
                    itemCount: listProducts.length,
                    itemBuilder: (context, index) {
                      final product = listProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndexProduct(idProduct: product.id ?? "",)),
                            );
                          });
                        },
                        child: Card(
                          child: ListTile(
                            title: Text("Produit : ${product.name}"),
                            subtitle: Text("Prix : ${product.price}"),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
