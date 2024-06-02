import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/who_we_are/who_we_are_home_desktop.dart';
import 'package:infinito_project_web/widgets/who_we_are/who_we_are_home_mobile.dart';

import '../constant/colors.dart';
import '../constant/size.dart';
import '../widgets/home/drawer_mobile.dart';
import '../widgets/home/footer_desktop.dart';
import '../widgets/home/footer_mobile.dart';
import '../widgets/home/header_desktop.dart';
import '../widgets/home/header_mobile.dart';

class WhoWeArePages extends StatefulWidget {
  const WhoWeArePages({Key? key}) : super(key: key);

  @override
  State<WhoWeArePages> createState() => _WhoWeArePagesState();
}

class _WhoWeArePagesState extends State<WhoWeArePages> {
  int hoverIndex = -1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 30,),
                constraints.maxWidth >= 900
                    ? const WhoWeAreHomeDesktop()
                    : const WhoWeAreHomeMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ?  FooterDesktop()
                    :  FooterMobile(),
              ],
            ));
      },
    );
  }
}
