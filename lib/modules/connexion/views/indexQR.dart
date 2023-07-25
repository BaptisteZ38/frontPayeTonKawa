import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/modules/connexion/layouts/layoutQR.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexQR extends HookConsumerWidget{
  const IndexQR({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: LayoutQR(),
        ),
      ),
    );
  }
}