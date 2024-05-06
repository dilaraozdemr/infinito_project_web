

import 'package:get/get.dart';
import 'package:infinito_project_web/pages/home_page.dart';
import 'package:infinito_project_web/pages/projects_page.dart';
import 'package:infinito_project_web/pages/who_we_are_page.dart';

appRoutes() => [
  GetPage(
    name: "/home",
    page: ()=> const HomePage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/projects",
    page: () => const ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/who',
    page: () => const WhoWeArePages(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/news',
    page: () => const ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin',
    page: () => const ProjectsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),

];

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }}