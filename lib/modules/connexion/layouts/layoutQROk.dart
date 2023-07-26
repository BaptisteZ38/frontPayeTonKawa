import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/produits/views/indexProductList.dart';
import 'package:front_paye_ton_kawa/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutQROk extends HookConsumerWidget {
  const LayoutQROk({super.key, required this.token});

  final token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            "Vous êtes authentifié avec succès !",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColor.primary80,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          DefaultButton(
            color: Theme.of(context).primaryColor,
            text: "Continuer",
            onPressed: () {
              if (token != "" && token != null) {
                ref.read(tokenProvider.notifier).state = token;
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IndexProductList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
