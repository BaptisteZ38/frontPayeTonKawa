import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/modules/connexion/layouts/layoutLogin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexLogin extends ConsumerWidget {
  const IndexLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: LayoutLogin(
            formKey: formKey,
          ),
        ),
      ),
    );
  }
}
