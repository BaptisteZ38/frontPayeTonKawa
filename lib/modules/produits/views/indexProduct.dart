import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/produits/layouts/layoutProduct.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexProduct extends HookConsumerWidget{
  const IndexProduct({super.key, required this.idProduct});
  final String idProduct;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Détail du produit",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: AppColor.primary80, fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: LayoutProduct(idProduct: idProduct),
        ),
      ),
    );
  }
  
}