import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/projects/projects_home_desktop.dart';
import 'package:infinito_project_web/widgets/projects/projects_home_mobile.dart';

import '../constant/colors.dart';
import '../constant/size.dart';
import '../widgets/home/drawer_mobile.dart';
import '../widgets/home/footer_desktop.dart';
import '../widgets/home/footer_mobile.dart';
import '../widgets/home/header_desktop.dart';
import '../widgets/home/header_mobile.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  int hoverIndex = -1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    ? const ProjectsHomeDesktop()
                    : const ProjectsHomeMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ?  FooterDesktop()
                    :  FooterMobile(),
              ],
            ));
      },
    );
  }
}
