import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/scanQRCode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutQR extends HookConsumerWidget {
  const LayoutQR({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Se connecter",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: AppColor.primary80, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              const Icon(
                Icons.qr_code_2_rounded,
                size: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Pour vous connecter, vous devez scanner le QR Code précedemment reçu par mail.",
                style: TextStyle(fontSize: 18, color: AppColor.primary80),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 50,
              ),
              DefaultButton(
                color: AppColor.primary80,
                text: "Scanner le QR Code",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QRViewExample(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
