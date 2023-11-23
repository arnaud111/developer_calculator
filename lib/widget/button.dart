import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.child,
    this.color,
    this.onTap,
    this.onLongPress,
    this.width,
    this.height,
  });

  final Widget child;
  final Color? color;
  final Function()? onTap;
  final Function()? onLongPress;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.15,
      height: height ?? MediaQuery.of(context).size.width * 0.15,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? const Color(0xFF31363B),
            borderRadius: const BorderRadius.all(
              Radius.circular(64),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
