import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/widgets/site_dark_logo.dart';

import '../../constant/colors.dart';
import '../../constant/nav_items.dart';
class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: buttonBar(1,(){
            Get.toNamed("/projects");
          })),
          Expanded(child: buttonBar(2,(){
            Get.toNamed("/who");
          })),
          Expanded(child: SiteDarkLogo(onTap: (){})),
          Expanded(child: buttonBar(3,(){
            Get.toNamed("/contact");
          })),
          Expanded(child: buttonBar(4,(){
            Get.toNamed("/news");
          })),
        ],
      ),
    );
  }
  Widget buttonBar(int a,Function onPressed){
    return TextButton(onPressed:(){
      onPressed.call();
    }, child: Text(navTitles[a], style: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w400, color: CustomColor.appBarBg
    ),));
  }
}