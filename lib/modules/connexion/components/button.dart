import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/config/constants/color_theme.dart';
import 'package:front_paye_ton_kawa/config/constants/shadow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultButton extends HookConsumerWidget {
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [shadow()]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColor.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}