import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/nav_items.dart';
import 'package:infinito_project_web/constant/size.dart';
import 'package:infinito_project_web/widgets/header_desktop.dart';
import 'package:infinito_project_web/widgets/main_desktop.dart';
import 'package:infinito_project_web/widgets/main_mobile.dart';
import 'package:infinito_project_web/widgets/who_we_are_desktop.dart';
import 'package:infinito_project_web/widgets/who_we_are_mobile.dart';

import '../constant/colors.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            key: scaffoldKey,
            backgroundColor: CustomColor.bgColor,
            endDrawer:
                constraints.maxWidth >= 600.0 ? null : const DrawerMobile(),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                // MAIN
                constraints.maxWidth >= kMinDesktopWidth
                    ? const HeaderDesktop()
                    : HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                //SKILLS
                //const MainDesktop(),
                const SizedBox(height: 30,),
                constraints.maxWidth >= kMinDesktopWidth
                    ? MainDesktop()
                    : const MainMobile(),
                constraints.maxWidth >= kMinDesktopWidth ? const WhoWeAreDesktop() : const WhoWeAreMobile(),

                Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      padding: const EdgeInsets.all(10),
                      children: [
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                        Container(child: Image.asset("assets/image/home.jpeg")),
                      ],
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }
}
