

import 'package:get/get.dart';
import 'package:infinito_project_web/pages/home_page.dart';
import 'package:infinito_project_web/pages/projects_page.dart';

appRoutes() => [
  GetPage(
    name: "/home",
    page: ()=> const HomePage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/projects",
    page: () => const ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),

  GetPage(
    name: '/news',
    page: () => ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin',
    page: () => ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),

];

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }}