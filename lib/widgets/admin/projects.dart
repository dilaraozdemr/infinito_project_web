import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/controller/adminController/projectController.dart';

import '../../constant/colors.dart';

class ProjectsAdminPage extends StatefulWidget {
  ProjectsAdminPage({Key? key}) : super(key: key);

  @override
  State<ProjectsAdminPage> createState() => _ProjectsAdminPageState();
}

class _ProjectsAdminPageState extends State<ProjectsAdminPage> {
  AdminController adminController = Get.put(AdminController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adminController.getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColor.appBarBg,
                width: 2),
            borderRadius: BorderRadius.circular(20),
            color: CustomColor.bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(
                    0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Text("Projeler",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: CustomColor.appBarBg),),
                  ),
                  Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: adminController.projectsResponseModel.value
                            .projects?.length ?? 0,
                        itemBuilder: (context, index) {
                          var model = adminController.projectsResponseModel
                              .value.projects?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0),
                            child: ListTile(
                              title: Text(model?.name ?? "",
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: CustomColor.appBarBg)),
                              onTap: () {},
                              subtitle: const Text(
                                  "27.03.3003", style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: CustomColor.appBarBg)),
                              leading: Text("${index + 1}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
                                      color: CustomColor.appBarBg)),
                              trailing: SizedBox(
                                width: 140,
                                height: 60,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var modified = model?.sId?.replaceAll('"', '');
                                        String url = "/admin/project/edit/$modified";
                                        Get.toNamed(url);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(20),
                                            color: CustomColor
                                                .appBarBg,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets
                                                .symmetric(
                                                horizontal: 20.0,
                                                vertical: 5),
                                            child: Center(
                                                child: Icon(Icons
                                                    .edit_note_sharp,
                                                    size: 20,
                                                    color: CustomColor
                                                        .bgColor)),
                                          )),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        adminController.deleteProject(
                                            model?.sId ?? "");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(20),
                                            color: CustomColor
                                                .appBarBg,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets
                                                .symmetric(
                                                horizontal: 20.0,
                                                vertical: 5),
                                            child: Center(
                                                child: Icon(
                                                    Icons.delete_outline,
                                                    size: 20,
                                                    color: CustomColor
                                                        .bgColor)),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
