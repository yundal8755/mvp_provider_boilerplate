import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/presentation/components/button/cool_button.dart';
import 'package:mvp_provider_boilerplate/presentation/components/button/cool_button_style.dart';

class IconTextButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;

  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final Color? borderColor;

  const IconTextButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPressed,
    this.leading,
    this.trailing,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CoolButton(
      onPressed: onPressed,
      style: CoolButtonStyle.main.copyWith(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
        shape: borderColor != null
            ? WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: borderColor!),
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? const SizedBox.shrink(),
          Text(text),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
