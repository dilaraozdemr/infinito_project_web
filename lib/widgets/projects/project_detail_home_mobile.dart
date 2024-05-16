import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../controller/homeController/projectControllerHome.dart';
class ProjectDetailHomeMobile extends StatefulWidget {
  final String id;
  const ProjectDetailHomeMobile({Key? key, required this.id}) : super(key: key);

  @override
  State<ProjectDetailHomeMobile> createState() => _ProjectDetailHomeMobileState();
}

class _ProjectDetailHomeMobileState extends State<ProjectDetailHomeMobile> {
  ProjectControllerHome projectControllerHome = Get.put(
      ProjectControllerHome());

  @override
  void initState() {
    super.initState();
    projectControllerHome.getProject(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return projectControllerHome.isLoadingHomeProjectDetail.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: CustomColor.appBarBg, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(projectControllerHome.selectedProject.value.name ?? "", style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30
              ),),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                          children: [
                            Text(
                              projectControllerHome.selectedProject.value.description ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                              ),)
                          ]),),
                  ],
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  padding: const EdgeInsets.all(10),
                  children:
                  List.generate(projectControllerHome.selectedProject.value.images?.length ?? 0, (index) {
                    return GestureDetector(
                      onTap: (){
                        Get.defaultDialog(content: CachedNetworkImage(
                          imageUrl: projectControllerHome.selectedProject
                              .value.images?[index] ??
                              "",
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: projectControllerHome.selectedProject
                              .value.images?[index] ??
                              "",
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
