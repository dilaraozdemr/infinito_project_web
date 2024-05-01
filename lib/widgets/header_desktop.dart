import 'package:flutter/material.dart';
import 'package:infinito_project_web/styles/style.dart';
import 'package:infinito_project_web/widgets/site_logo.dart';

import '../constant/colors.dart';
import '../constant/nav_items.dart';
class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50, bottom: 10),
      child: Container(
        height: 60.0,
        margin: const EdgeInsets.symmetric(vertical:10.0, horizontal: 20.0 ),
        width: double.maxFinite,
        decoration: kHeaderDecoraiton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonBar(1),
            const SizedBox(width: 50,),
            buttonBar(2),
            SiteLogo(onTap: (){}),
            buttonBar(3),
            const SizedBox(width: 50,),
            buttonBar(4),
          ],
        ),
      ),
    );
  }
  Widget buttonBar(int a){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: TextButton(onPressed: (){}, child: Text(navTitles[a], style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: CustomColor.appBarBg
      ),)),
    );
  }
}
