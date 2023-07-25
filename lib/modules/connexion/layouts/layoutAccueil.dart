import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/connexion/views/indexLogin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutAccueil extends HookConsumerWidget {
  const LayoutAccueil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/payetonkawa.png',
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Le café c'est la vie",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppColor.primary80, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            color: AppColor.primary80,
            text: "Commencer",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IndexLogin(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
