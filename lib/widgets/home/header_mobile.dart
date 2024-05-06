import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/site_dark_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({Key? key, this.onLogoTap, this.onMenuTap}) : super(key: key);
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SiteDarkLogo(onTap: onLogoTap ?? (){}),
        const Spacer(),
        IconButton(onPressed: onMenuTap ?? (){}, icon: Icon(Icons.menu),),
        const SizedBox(width: 30),
      ],
    );
  }
}
