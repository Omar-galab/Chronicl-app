import 'package:flutter/material.dart';

class DefultButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColore;
  final Color? textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const DefultButton({
    super.key,
    this.text,
    this.backgroundColore,
    this.textColor,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.disabled)) {
              return backgroundColore?.withValues(alpha: 0.5);
            } else {
              return backgroundColore;
            }
          }),
          foregroundColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.disabled)) {
              return textColor?.withValues(alpha: 0.5);
            } else {
              return textColor;
            }
          }),
          padding: WidgetStatePropertyAll(padding),
        ),
        child: Text(text ?? ''),
      ),
    );
  }
}
