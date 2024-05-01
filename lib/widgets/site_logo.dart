import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset("assets/image/logo.png", width: 120, height: 120,),
    );
  }
}
