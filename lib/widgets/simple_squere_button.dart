import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SimpleSquereButton extends StatelessWidget {
  final VoidCallback? onPressed;
  IconData icon;
  Color? colorBg;
  Color? colorFg;
  bool smaller;

  SimpleSquereButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.colorBg,
    this.colorFg,
    this.smaller = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Get.theme;

    colorBg ??= _theme.colorScheme.primary;
    colorFg ??= _theme.colorScheme.onPrimary;

    return Material(
      borderRadius: BorderRadius.circular(smaller ? 15 : 30),
      child: InkWell(
        splashColor: colorFg?.withAlpha(100),
        borderRadius: BorderRadius.circular(smaller ? 15 : 30),
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(smaller ? 15 : 30),
              color: colorBg),
          child: SizedBox(
            height: smaller ? 40 : 50,
            width: smaller ? 40 : 50,
            child: Icon(
              icon,
              size: 21,
              color: colorFg,
            ),
          ),
        ),
      ),
    );
  }
}
