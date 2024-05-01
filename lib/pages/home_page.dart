import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/size.dart';
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
                ?
                const ProjectsDesktop(): const ProjectsMobile(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColor.appBarBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SiteLogo(onTap: (){}),
                            const SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  const Text("Follow us : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: CustomColor.bgColor),),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/image/gmail.png", width: 30),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/image/instagram.png", width: 30),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/image/whatsapp.png", width: 30),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/image/linkedin.png", width: 30),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/image/youtube.png", width: 30),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text("Sitenin tüm hakları Infinito Project' e aittir.", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: CustomColor.bgColor,),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}

