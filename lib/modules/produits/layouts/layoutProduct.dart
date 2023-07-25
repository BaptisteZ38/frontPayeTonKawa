import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/controllers/productsController.dart';
import 'package:front_paye_ton_kawa/models/products.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/realiteAugmente/layouts/layoutAR.dart';
import 'package:front_paye_ton_kawa/modules/realiteAugmente/views/indexAR.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutProduct extends HookConsumerWidget {
  const LayoutProduct({super.key, required this.idProduct});

  final String idProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsController = ProductsController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<Products>(
              future: productsController.getProductsById(idProduct),
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
                  return Column(
                    children: [
                      Text(
                        product.name ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: AppColor.primary80, fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                }
              },
            ),
          ),
          DefaultButton(
            color: AppColor.primary80,
            text: "Réalité augmentée",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LayoutAR(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
