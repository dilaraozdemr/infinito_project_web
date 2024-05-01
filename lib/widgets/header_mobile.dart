import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/site_logo.dart';

import '../styles/style.dart';
class HeaderMobile extends StatelessWidget {
  const HeaderMobile({Key? key, this.onLogoTap, this.onMenuTap}) : super(key: key);
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoraiton,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap ?? (){}),
          const Spacer(),
          IconButton(onPressed: onMenuTap ?? (){}, icon: Icon(Icons.menu),),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
