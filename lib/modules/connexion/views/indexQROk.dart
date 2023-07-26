import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/modules/connexion/layouts/layoutQROk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexQRCodeOk extends HookConsumerWidget {
  const IndexQRCodeOk({super.key, required this.token});

  final token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: LayoutQROk(token: token,)
        ),
      ),
    );
  }
}
