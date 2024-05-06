import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteDarkLogo extends StatelessWidget {
  const SiteDarkLogo({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/home"),
      child: Image.asset("assets/image/dark_logo.png", width: 120, height: 120,),
    );
  }
}
