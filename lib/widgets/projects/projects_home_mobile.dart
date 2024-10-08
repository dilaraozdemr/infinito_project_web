import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/animated_image.dart';
import '../../constant/colors.dart';
import '../../constant/utils.dart';
import '../../controller/homeController/projectControllerHome.dart';

class ProjectsHomeMobile extends StatefulWidget {
  const ProjectsHomeMobile({Key? key}) : super(key: key);

  @override
  State<ProjectsHomeMobile> createState() => _ProjectsHomeMobileState();
}

class _ProjectsHomeMobileState extends State<ProjectsHomeMobile> {
  int hoverIndex = -1;

  ProjectControllerHome projectControllerHome = Get.put(
      ProjectControllerHome());

  @override
  void initState() {
    super.initState();
    projectControllerHome.getProjectsHome();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return projectControllerHome.isLoadingHomeProjects.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            const Text("Projelerimiz", style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 40),),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: CustomColor.appBarBg, width: 3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: const EdgeInsets.all(10),
                      children:
                      List.generate(projectControllerHome.projectsResponseModel
                          .value.projects?.length ?? 0, (index) {
                        return GestureDetector(
                          onTap: (){
                            var id = projectControllerHome.projectsResponseModel
                                .value.projects?[index]
                                .sId?.replaceAll(
                                '"', '');
                            var name = slugify(projectControllerHome.projectsResponseModel
                                .value.projects?[index].name ?? "");

                            var url = "/home/project/${name}";

                            Get.rootDelegate.toNamed(url,arguments: id);
                          },
                          child: HoverContainer(
                            onHover: (isHovering) {
                              setState(() {
                                hoverIndex = isHovering ? index : -1;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: projectControllerHome.projectsResponseModel
                                        .value.projects?[index].images?.first ??
                                        "",
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                if (hoverIndex == index)
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        projectControllerHome
                                            .projectsResponseModel.value
                                            .projects?[index].name ?? "",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
