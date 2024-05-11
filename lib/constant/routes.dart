

import 'package:get/get.dart';
import 'package:infinito_project_web/pages/admin_page.dart';
import 'package:infinito_project_web/pages/contact_page.dart';
import 'package:infinito_project_web/pages/home_page.dart';
import 'package:infinito_project_web/pages/news_page.dart';
import 'package:infinito_project_web/pages/projects_page.dart';
import 'package:infinito_project_web/pages/who_we_are_page.dart';
import 'package:infinito_project_web/widgets/admin/add_project.dart';
import 'package:infinito_project_web/widgets/admin/contact.dart';
import 'package:infinito_project_web/widgets/admin/edit_new.dart';
import 'package:infinito_project_web/widgets/admin/edit_project.dart';
import 'package:infinito_project_web/widgets/admin/new.dart';
import 'package:infinito_project_web/widgets/admin/projects.dart';

import '../widgets/admin/add_new.dart';

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
    name: '/contact',
    page: () => const ContactPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/news',
    page: () => const NewsPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin',
    page: () => const AdminPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/projects',
    page: () => ProjectsAdminPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/news',
    page: () => const NewsAdminPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/contacts',
    page: () => const ContactsAdminPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/add/project',
    page: () => AddProjectPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/edit/project/:id',
    page: () => EditProjectPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/add/new',
    page: () => AddNewPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/admin/edit/new/:id',
    page: () => EditNewPage(),
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