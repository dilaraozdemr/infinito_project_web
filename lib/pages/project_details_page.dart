import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/widgets/projects/projects_detail_home_desktop.dart';

import '../constant/colors.dart';
import '../constant/size.dart';
import '../widgets/home/drawer_mobile.dart';
import '../widgets/home/footer_desktop.dart';
import '../widgets/home/footer_mobile.dart';
import '../widgets/home/header_desktop.dart';
import '../widgets/home/header_mobile.dart';
import '../widgets/projects/project_detail_home_mobile.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  var idFromRoot = "";
  int hoverIndex = -1;
  final scaffoldKey = GlobalKey<ScaffoldState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = Get.parameters;
    String id = data['id'] ?? "";
    idFromRoot = id;
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
                    ? ProjectDetailHomeDesktop(id: idFromRoot,)
                    : ProjectDetailHomeMobile(id: idFromRoot),
                constraints.maxWidth >= kMinDesktopWidth
                    ? const FooterDesktop()
                    : const FooterMobile(),
              ],
            ));
      },
    );
  }
}
