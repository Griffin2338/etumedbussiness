import 'package:flutter/material.dart';

class BaseBodyLayout extends StatelessWidget {
  final Widget child;
  final String asset;

  BaseBodyLayout({required this.child, required this.asset});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(8), child: child),
    );
  }
}
