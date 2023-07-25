import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_paye_ton_kawa/modules/connexion/layouts/layoutAccueil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexAccueil extends HookConsumerWidget{
  const IndexAccueil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: LayoutAccueil(),
        ),
      ),
    );
  }
  
}