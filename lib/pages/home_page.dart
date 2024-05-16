import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/constant/size.dart';
import 'package:infinito_project_web/widgets/home/footer_desktop.dart';
import 'package:infinito_project_web/widgets/home/footer_mobile.dart';
import 'package:infinito_project_web/widgets/home/main_desktop.dart';
import 'package:infinito_project_web/widgets/home/who_we_are_desktop.dart';
import 'package:infinito_project_web/widgets/home/who_we_are_mobile.dart';
import '../constant/colors.dart';
import '../controller/homeController/projectControllerHome.dart';
import '../widgets/home/drawer_mobile.dart';
import '../widgets/home/header_desktop.dart';
import '../widgets/home/header_mobile.dart';
import '../widgets/home/main_mobile.dart';
import '../widgets/home/projects_desktop.dart';
import '../widgets/home/projects_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProjectControllerHome projectControllerHome = Get.put(
      ProjectControllerHome());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectControllerHome.getProjectsHome();
  }
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

