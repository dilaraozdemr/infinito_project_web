import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset("assets/image/logo.png"),
      ),
    );
  }
}
