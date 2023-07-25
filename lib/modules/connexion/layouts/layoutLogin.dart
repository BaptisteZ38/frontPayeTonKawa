import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/button.dart';
import 'package:front_paye_ton_kawa/modules/connexion/components/textInput.dart';
import 'package:front_paye_ton_kawa/modules/connexion/views/indexQR.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutLogin extends HookConsumerWidget {
  const LayoutLogin({
    super.key,
    required this.formKey,
  });

  final formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            children: [
              Text(
                "Email",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: AppColor.primary80),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextInput(
                      icon: FontAwesomeIcons.envelope,
                      label: "Veuillez renseigner votre email",
                      placeholder: "Entre ton email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir votre adresse e-mail';
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Veuillez saisir une adresse e-mail valide';
                        }
                        return null;
                      },
                      controller: mailController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                color: AppColor.primary80,
                text: "Envoyer",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Navigator.push(context, MaterialPageRoute( builder: (context) => IndexQR()),);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
