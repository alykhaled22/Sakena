import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onPressed, required this.icon});

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 45,
      child: IconButton(
        iconSize: 22,
        padding: EdgeInsets.zero,
        disabledColor: Colors.grey,
        color: Colors.black,
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
