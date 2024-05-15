import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteDarkLogo extends StatelessWidget {
  const SiteDarkLogo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.rootDelegate.toNamed("/home"),
      child: Image.asset("assets/image/dark_logo.png", width: 120, height: 120,),
    );
  }
}
