import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:infinito_project_web/controller/adminController/newController.dart';

import '../../constant/colors.dart';

class AddNewPage extends StatefulWidget {
  AddNewPage({Key? key}) : super(key: key);

  @override
  State<AddNewPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddNewPage> {
  final NewController newController = Get.put(NewController());
  TextEditingController new_name = TextEditingController();
  TextEditingController new_description = TextEditingController();
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
                              "Duyuru Ekle",
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
                                              newController.newTitle
                                                  .value = new_name.text;
                                            },
                                            controller: new_name,
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
                                            controller: new_description,
                                            onChanged: (String value) {
                                              newController.newDescription
                                                  .value =
                                                  new_description.text;
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
                                            Uint8List? bytesFromPicker = await ImagePickerWeb
                                                .getImageAsBytes();
                                            setState(() {
                                              newController.newImage.value =
                                                  bytesFromPicker ??
                                                      Uint8List(0);
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
                                            onTap: newController.isNewLoading
                                                .value ? null : () async {
                                              await newController.sendNew();
                                              Get.rootDelegate.toNamed("/admin");
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
                                                child: newController.isNewLoading
                                                    .value
                                                    ? const CircularProgressIndicator()
                                                    : const Text(
                                                  "Duyuru Yükle",
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
                                    newController.newTitle.value =
                                        new_name.text;
                                  },
                                  controller: new_name,
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
                                    newController.newDescription.value =
                                        new_description.text;
                                  },
                                  controller: new_description,
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
                                  Uint8List? bytesFromPicker = await ImagePickerWeb
                                      .getImageAsBytes();
                                  setState(() {
                                    newController.newImage.value =
                                        bytesFromPicker ?? Uint8List(0);
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
                                onTap: newController.isNewLoading
                                    .value ? null : () async {
                                  await newController.sendNew();
                                  Get.rootDelegate.toNamed("/admin");
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
                                      "Duyuru Yükle",
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
                          Container(
                            width: 400,
                            height: 400,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: imageAvailable
                                      ? newController.newImage.value.isNotEmpty ?Image.memory(
                                      newController.newImage.value): const SizedBox()
                                      : const SizedBox(),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        newController.newImage.value = Uint8List(0);
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
                            ),
                          )
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
