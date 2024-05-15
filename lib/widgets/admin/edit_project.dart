import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../constant/colors.dart';
import '../../controller/adminController/projectController.dart';

class EditProjectPage extends StatefulWidget {
  EditProjectPage({Key? key}) : super(key: key);

  @override
  State<EditProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<EditProjectPage> {
  final AdminController adminController = Get.put(AdminController());

  bool imageAvailable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = Get.parameters;
    String id = data['id'] ?? "";
    adminController.getProject(id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(() {
        return Scaffold(
            body: adminController.isLoadingForSingleProject.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Obx(() {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomColor.appBarBg, width: 2),
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
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  "Proje Düzenle",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 40,
                                      color: CustomColor.appBarBg),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Proje Başlığı:",
                                              style: TextStyle(
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30,
                                                  color: CustomColor.appBarBg),
                                            ),
                                            SizedBox(height: 30),
                                            Text(
                                              "Projenin Açıklaması:",
                                              style: TextStyle(
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30,
                                                  color: CustomColor.appBarBg),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        constraints.maxWidth >= 1000
                                            ? Column(
                                          children: [
                                            const SizedBox(width: 20),
                                            SizedBox(
                                              height: 50,
                                              width: 300,
                                              child: TextFormField(
                                                onChanged: (String value) {
                                                  adminController
                                                      .projectTitleForEdit
                                                      .value =
                                                      adminController
                                                          .project_name_edit
                                                          .text;
                                                },
                                                controller: adminController
                                                    .project_name_edit,
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color:
                                                        Colors.transparent),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.5),
                                                  ),
                                                  enabledBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  fillColor: Color(0xff7AA2E3)
                                                      .withOpacity(0.2),
                                                  filled: true,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 150,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5.5),
                                                color: Color(0xff7AA2E3)
                                                    .withOpacity(0.2),
                                              ),
                                              child: TextField(
                                                controller: adminController
                                                    .project_description_edit,
                                                onChanged: (String value) {
                                                  adminController
                                                      .projectDescriptionForEdit
                                                      .value =
                                                      adminController
                                                          .project_description_edit
                                                          .text;
                                                },
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: CustomColor
                                                        .appBarBg),
                                                maxLines: 8,
                                                decoration: const InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.all(10.0),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent)),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                            : const SizedBox(),
                                        const SizedBox(width: 40),
                                        constraints.maxWidth >= 1000
                                            ? Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                List<
                                                    Uint8List>? bytesFromPicker =
                                                await ImagePickerWeb
                                                    .getMultiImagesAsBytes();
                                                setState(() {
                                                  bytesFromPicker
                                                      ?.forEach((element) {
                                                    adminController
                                                        .imageFilesEdit
                                                        .add(element);
                                                  });
                                                  imageAvailable = true;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: CustomColor.appBarBg,
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35.0,
                                                      vertical: 10),
                                                  child: Text(
                                                    "Fotoğraf Ekle",
                                                    style: TextStyle(
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 20,
                                                        color:
                                                        CustomColor.bgColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Obx(() {
                                              return GestureDetector(
                                                onTap: adminController
                                                    .isLoadingForEdit
                                                    .value ? null : () async {
                                                  await adminController
                                                      .updateProject(
                                                      adminController
                                                          .selectedProject.value
                                                          .sId ?? "");
                                                  Get.rootDelegate.offAndToNamed("/admin");
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: CustomColor.appBarBg,
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 30.0,
                                                        vertical: 10),
                                                    child: adminController
                                                        .isLoadingForEdit.value
                                                        ? const CircularProgressIndicator()
                                                        : const Text(
                                                      "Proje Güncelle",
                                                      style: TextStyle(
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 20,
                                                          color:
                                                          CustomColor.bgColor),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        )
                                            : const SizedBox(),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              constraints.maxWidth >= 1000
                                  ? const SizedBox()
                                  : Column(
                                children: [
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: TextFormField(
                                      onChanged: (String value) {
                                        adminController.projectTitleForEdit
                                            .value =
                                            adminController.project_name_edit
                                                .text;
                                      },
                                      controller: adminController
                                          .project_name_edit,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(5.5),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        fillColor:
                                        Color(0xff7AA2E3).withOpacity(0.2),
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.5),
                                      color: Color(0xff7AA2E3).withOpacity(0.2),
                                    ),
                                    child: TextField(
                                      onChanged: (String value) {
                                        adminController
                                            .projectDescriptionForEdit.value =
                                            adminController
                                                .project_description_edit.text;
                                      },
                                      controller: adminController
                                          .project_description_edit,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: CustomColor.appBarBg),
                                      maxLines: 8,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10.0),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                              constraints.maxWidth >= 1000
                                  ? const SizedBox()
                                  : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      List<Uint8List>? bytesFromPicker =
                                      await ImagePickerWeb
                                          .getMultiImagesAsBytes();
                                      setState(() {
                                        bytesFromPicker?.forEach((element) {
                                          adminController.imageFilesEdit.add(
                                              element);
                                        });
                                        imageAvailable = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: CustomColor.appBarBg,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35.0, vertical: 10),
                                        child: Text(
                                          "Fotoğraf Ekle",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: CustomColor.bgColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      adminController.updateProject(
                                          adminController.selectedProject.value
                                              .sId ?? "");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: CustomColor.appBarBg,
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0,
                                            vertical: 10),
                                        child: Text(
                                          "Proje Güncelle",
                                          style: TextStyle(
                                              overflow:
                                              TextOverflow.ellipsis,
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 20,
                                              color:
                                              CustomColor.bgColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                padding: const EdgeInsets.all(10),
                                children: List.generate(
                                    adminController.selectedProject.value.images
                                        ?.length ?? 0, (index) {
                                  return Stack(
                                    children: [
                                      Container(
                                          color: Colors.transparent,
                                          child:
                                          Image.network(
                                            adminController.selectedProject
                                                .value.images?[index] ?? "",
                                          )

                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              adminController.selectedProject
                                                  .value.images
                                                  ?.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  10),
                                              color: CustomColor.appBarBg,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.close_rounded,
                                                color: CustomColor.bgColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),

                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                padding: const EdgeInsets.all(10),
                                children: List.generate(
                                    adminController.imageFilesEdit.length, (
                                    index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: imageAvailable
                                            ? Image.memory(
                                            adminController
                                                .imageFilesEdit[index])
                                            : SizedBox(),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              adminController.imageFilesEdit
                                                  .removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  10),
                                              color: CustomColor.appBarBg,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.close_rounded,
                                                color: CustomColor.bgColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ));
      });
    });
  }
}
