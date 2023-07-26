import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/controllers/productsController.dart';
import 'package:front_paye_ton_kawa/models/products.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/realiteAugmente/layouts/layoutAR.dart';
import 'package:front_paye_ton_kawa/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutProduct extends HookConsumerWidget {
  const LayoutProduct({super.key, required this.idProduct});

  final String idProduct;

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
            child: FutureBuilder<Products>(
              future: productsController.getProductsById(idProduct, token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Erreur lors du chargement des produits.");
                } else if (!snapshot.hasData) {
                  return const Text("Le tableau vide");
                } else {
                  final product = snapshot.data!;
                  Color indicatorColor = Colors.grey;
                  if (product.color == "Bleu") {
                    indicatorColor = Colors.blue;
                  } else if (product.color == "Vert") {
                    indicatorColor = Colors.green;
                  } else if (product.color == "Rose") {
                    indicatorColor = Colors.pink;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(
                              image: AssetImage('assets/${product.name}.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.name ?? "",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
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
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Description produit : ${product.description}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Prix : ${product.price} €',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
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
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        DefaultButton(
                          color: AppColor.primary80,
                          text: "Réalité augmentée",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    LayoutAR(nom: product.name ?? ""),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
