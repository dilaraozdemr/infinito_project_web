import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/news/news_desktop.dart';
import 'package:infinito_project_web/widgets/news/news_mobile.dart';

import '../constant/colors.dart';
import '../constant/size.dart';
import '../widgets/home/drawer_mobile.dart';
import '../widgets/home/footer_desktop.dart';
import '../widgets/home/footer_mobile.dart';
import '../widgets/home/header_desktop.dart';
import '../widgets/home/header_mobile.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
                    ? const NewsDesktop()
                    : const NewsMobile(),
                constraints.maxWidth >= kMinDesktopWidth
                    ? const FooterDesktop()
                    : const FooterMobile(),
              ],
            ));
      },
    );
  }
}
