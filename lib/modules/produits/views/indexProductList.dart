import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/produits/layouts/layoutProductList.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexProductList extends HookConsumerWidget {
  const IndexProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Les cafetières",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: AppColor.primary80, fontSize: 40),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: LayoutProductList(),
        ),
      ),
    );
  }
}
