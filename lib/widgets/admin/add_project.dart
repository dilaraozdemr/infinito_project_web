import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../constant/colors.dart';
import '../../controller/adminController/projectController.dart';

class AddProjectPage extends StatefulWidget {
  AddProjectPage({Key? key}) : super(key: key);

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final AdminController adminController = Get.put(AdminController());
  TextEditingController project_name = TextEditingController();
  TextEditingController project_description = TextEditingController();
  bool imageAvailable = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.appBarBg, width: 2),
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
                              "Proje Ekle",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "Proje Başlığı:",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                              color: CustomColor.appBarBg),
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          "Projenin Açıklaması:",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
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
                                              adminController.projectTitle
                                                  .value = project_name.text;
                                            },
                                            controller: project_name,
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
                                            controller: project_description,
                                            onChanged: (String value) {
                                              adminController.projectDescription
                                                  .value =
                                                  project_description.text;
                                            },
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: CustomColor.appBarBg),
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
                                            List<Uint8List>? bytesFromPicker =
                                            await ImagePickerWeb
                                                .getMultiImagesAsBytes();
                                            setState(() {
                                              bytesFromPicker
                                                  ?.forEach((element) {
                                                adminController.imageFiles
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
                                                  horizontal: 20.0,
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
                                            onTap: adminController.isLoading.value ? null:() async {
                                              await adminController.sendProject();
                                              Get.rootDelegate.toNamed("/admin");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: CustomColor.appBarBg,
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30.0,
                                                    vertical: 10),
                                                child: adminController.isLoading.value ? const CircularProgressIndicator():const Text(
                                                  "Proje Yükle",
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
                                    adminController.projectTitle.value =
                                        project_name.text;
                                  },
                                  controller: project_name,
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
                                    adminController.projectTitle.value =
                                        project_description.text;
                                  },
                                  controller: project_description,
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
                                      adminController.imageFiles.add(element);
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
                                        horizontal: 22.0, vertical: 10),
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
                                onTap: adminController.isLoading.value ? null:() async {
                                  await adminController.sendProject();
                                 // Get.rootDelegate.popRoute();
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
                                      "Proje Yükle",
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
                                adminController.imageFiles.length, (index) {
                              return Stack(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: imageAvailable
                                        ? Image.memory(
                                        adminController.imageFiles[index])
                                        : SizedBox(),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          adminController.imageFiles
                                              .removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
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
            ),
          ));
    });
  }
}
