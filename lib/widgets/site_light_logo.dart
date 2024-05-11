import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteLightLogo extends StatelessWidget {
  const SiteLightLogo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.rootDelegate.toNamed("/admin"),
        child: Image.asset("assets/image/light_logo.png", width: 160, height: 160,));
  }
}
