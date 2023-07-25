import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextInput extends HookConsumerWidget {
  const TextInput({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.validator,
    this.icon = FontAwesomeIcons.xmark,
    this.visibleIcon = true,
    this.isSecret = false,
    this.isFinal = false,
    this.controller = null,
    this.isRequired = false,
    this.name = "",
  }) : super(key: key);

  final String label;
  final String placeholder;
  final IconData icon;
  final bool visibleIcon;
  final bool isSecret;
  final bool isFinal;
  final bool isRequired;
  final String name;

  final controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = isSecret ? useState(false) : null;
    final inputValue = ref.watch(inputValueProvider.notifier).state;

    bool containsOnlyLetters(String input) {
      final RegExp regex = RegExp(r"^[A-Za-z]+$");
      return regex.hasMatch(input);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            if (isRequired == true)
              Text(
                '*',
                style: TextStyle(color: AppColor.error100),
              )
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          controller: name != ""
              ? controller
              : TextEditingController(text: inputValue),
          textAlignVertical: TextAlignVertical.center,
          obscureText:
              isPasswordVisible != null ? !isPasswordVisible.value : false,
          enableSuggestions: !isSecret,
          textInputAction:
              isFinal ? TextInputAction.done : TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
            fillColor: AppColor.white,
            contentPadding: EdgeInsets.zero,
            hintText: placeholder,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            errorStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppColor.error100),
            prefixIcon: visibleIcon
                ? Padding(
                    padding: EdgeInsets.all(
                      20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          icon,
                          size: 25,
                        ),
                      ],
                    ),
                  )
                : null,
            prefix: visibleIcon
                ? null
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
            suffixIcon: isPasswordVisible != null
                ? IconButton(
                    icon: isPasswordVisible.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                  )
                : null,
          ),
          validator: validator,
          onChanged: (value) {
            ref.read(inputValueProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}