import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/site_logo.dart';

import '../constant/colors.dart';
import '../constant/nav_items.dart';
class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: buttonBar(1)),
          Expanded(child: buttonBar(2)),
          Expanded(child: SiteLogo(onTap: (){})),
          Expanded(child: buttonBar(3)),
          Expanded(child: buttonBar(4)),
        ],
      ),
    );
  }
  Widget buttonBar(int a){
    return TextButton(onPressed: (){}, child: Text(navTitles[a], style: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w400, color: CustomColor.appBarBg
    ),));
  }
}
