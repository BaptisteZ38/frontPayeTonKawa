import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/controllers/productsController.dart';
import 'package:front_paye_ton_kawa/models/products.dart';
import 'package:front_paye_ton_kawa/modules/produits/views/indexProduct.dart';
import 'package:front_paye_ton_kawa/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutProductList extends HookConsumerWidget {
  const LayoutProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsController = ProductsController();
    final token = ref.watch(tokenProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<Products>>(
              future: productsController.getAllProducts(token),
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
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemCount: listProducts.length,
                    itemBuilder: (context, index) {
                      final product = listProducts[index];
                      Color indicatorColor = Colors.grey;
                      if (product.color == "Bleu") {
                        indicatorColor = Colors.blue;
                      } else if (product.color == "Vert") {
                        indicatorColor = Colors.green;
                      } else if (product.color == "Rose") {
                        indicatorColor = Colors.pink;
                      }
                      return GestureDetector(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IndexProduct(
                                  idProduct: product.id ?? "",
                                ),
                              ),
                            );
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10.0)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${product.name}.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${product.name}",
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              "Prix : ${product.price} €",
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: indicatorColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  "${product.color}",
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Stock : ",
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Container(
                                            width: 10.0,
                                            height: 10.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: product.stock != "0"
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            "${product.stock}",
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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