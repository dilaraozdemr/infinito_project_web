import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/nav_items.dart';
class DrawerMobile extends StatelessWidget {
  const DrawerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.bgColor,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.close)),
            ),
          ),
          drawerBar(0),
          drawerBar(1),
          drawerBar(2),
          drawerBar(3),
          drawerBar(4),
        ],
      ),
    );
  }
  Widget drawerBar(int a){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListTile(
        titleTextStyle: const TextStyle(
          color: CustomColor.whitePrimary,
          fontWeight: FontWeight.w400,
          fontFamily: "Playfair",
          fontSize: 16,
        ),
        onTap: (){},
        leading: Image.asset(navIcons[a]),
        title: Text(navTitles[a],style: const TextStyle(fontWeight: FontWeight.w400,
          fontSize: 16,),),
      ),
    );
  }
}
