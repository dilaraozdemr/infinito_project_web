import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/size.dart';
import 'package:infinito_project_web/widgets/footer_desktop.dart';
import 'package:infinito_project_web/widgets/footer_mobile.dart';
import 'package:infinito_project_web/widgets/header_desktop.dart';
import 'package:infinito_project_web/widgets/main_desktop.dart';
import 'package:infinito_project_web/widgets/main_mobile.dart';
import 'package:infinito_project_web/widgets/projects_desktop.dart';
import 'package:infinito_project_web/widgets/projects_mobile.dart';
import 'package:infinito_project_web/widgets/site_logo.dart';
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
                constraints.maxWidth >= kMinDesktopWidth
                    ? const MainDesktop()
                    : const MainMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ? const WhoWeAreDesktop()
                    : const WhoWeAreMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ? const ProjectsDesktop()
                    : const ProjectsMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ? const FooterDesktop()
                    : const FooterMobile(),
              ],
            ));
      },
    );
  }
}

