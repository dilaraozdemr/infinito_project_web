import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:infinito_project_web/constant/colors.dart';
import 'package:infinito_project_web/controller/adminController/contactController.dart';
import 'package:infinito_project_web/controller/adminController/newController.dart';
import 'package:infinito_project_web/controller/adminController/projectController.dart';
import 'package:infinito_project_web/widgets/site_dark_logo.dart';

import '../../constant/size.dart';
import '../../controller/adminController/authController.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  AdminController adminController = Get.put(AdminController());
  NewController newController = Get.put(NewController());
  ContactController contactController = Get.put(ContactController());
  AuthController authController = Get.put(AuthController());

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordControllerRegister = TextEditingController();
  TextEditingController userNameControllerRegister = TextEditingController();

  TextEditingController forgotpasswordController = TextEditingController();
  TextEditingController securityQuestionController = TextEditingController();
  TextEditingController securityQuestionControllerForgot = TextEditingController();
  TextEditingController forgotuserNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.checkLogin();
    adminController.getProjects();
    newController.getNews();
    contactController.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(() {
        return authController.isLogined.value
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: CustomColor.appBarBg, width: 2),
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
                        child:  Row(
                          children: [
                            SiteDarkLogo(),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Admin Paneli",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40,
                                      color: CustomColor.appBarBg),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  authController.disconnect();
                                },
                                child: Icon(Icons.login,size: 40,)),
                            SizedBox(width: 30,)
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColor.appBarBg,
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          child:  Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12),
                            child: Text(
                              "Visitor Count ${authController.visitorsCount.value.toString()}",
                              style: TextStyle(
                                  overflow:
                                  TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: CustomColor.bgColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColor.appBarBg,
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          child:  Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12),
                            child: Text(
                              "Active Admin Count ${authController.activeUsersCount.value.toString()}",
                              style: TextStyle(
                                  overflow:
                                  TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: CustomColor.bgColor),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  await Get.rootDelegate
                                      .toNamed("/admin/projects/add");
                                  adminController.getProjects();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColor.appBarBg, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                    color: CustomColor.appBarBg,
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
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Center(
                                      child: Text(
                                        "Proje Ekle",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 35,
                                            color: CustomColor.bgColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  await Get.rootDelegate
                                      .toNamed('/admin/news/add');
                                  newController.getNews();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColor.appBarBg, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                    color: CustomColor.appBarBg,
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
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Center(
                                      child: Text(
                                        "Duyuru Ekle",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 35,
                                            color: CustomColor.bgColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          constraints.maxWidth >= kMinDesktopWidth
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustomColor.appBarBg,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                        color: CustomColor.appBarBg,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Center(
                                          child: Text(
                                            "İletişim",
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 35,
                                                color: CustomColor.bgColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Column(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Projeler",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 40,
                                              color: CustomColor.appBarBg),
                                        ),
                                      ),
                                      Obx(() {
                                        return adminController
                                                .isLoadingProjects.value
                                            ? CircularProgressIndicator()
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: adminController
                                                    .getProjectsItemCount(),
                                                itemBuilder: (context, index) {
                                                  var model = adminController
                                                      .projectsResponseModel
                                                      .value
                                                      .projects?[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: ListTile(
                                                      title: Text(
                                                          model?.name ?? "",
                                                          style: const TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 24,
                                                              color: CustomColor
                                                                  .appBarBg)),
                                                      onTap: () {},
                                                      leading: Text(
                                                          "${index + 1} -",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 30,
                                                              color: CustomColor
                                                                  .appBarBg)),
                                                      trailing: SizedBox(
                                                        width: 140,
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                var modified = model
                                                                    ?.sId
                                                                    ?.replaceAll(
                                                                        '"',
                                                                        '');
                                                                String url =
                                                                    "/admin/project/edit/$modified";
                                                                Get.rootDelegate
                                                                    .toNamed(
                                                                        url);
                                                              },
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: CustomColor
                                                                        .appBarBg,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.0,
                                                                        vertical:
                                                                            5),
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .edit_note_sharp,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                CustomColor.bgColor)),
                                                                  )),
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            GestureDetector(
                                                              onTap: () {
                                                                adminController
                                                                    .deleteProject(
                                                                        model?.sId ??
                                                                            "");
                                                              },
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: CustomColor
                                                                        .appBarBg,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.0,
                                                                        vertical:
                                                                            5),
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .delete_outline,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                CustomColor.bgColor)),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                      }),
                                      const SizedBox(height: 40),
                                      GestureDetector(
                                        onTap: () => Get.rootDelegate
                                            .toNamed("/admin/projects"),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CustomColor.appBarBg,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 12),
                                            child: Text(
                                              "Tümünü Gör",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: CustomColor.bgColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Duyurular",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 40,
                                              color: CustomColor.appBarBg),
                                        ),
                                      ),
                                      Obx(() {
                                        return newController.isLoadingNews.value
                                            ? CircularProgressIndicator()
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: newController
                                                    .getNewsItemCount(),
                                                itemBuilder: (context, index) {
                                                  var model = newController
                                                      .newResponseModel
                                                      .value
                                                      .news?[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: ListTile(
                                                      title: Text(
                                                          model?.name ?? "",
                                                          style: const TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 24,
                                                              color: CustomColor
                                                                  .appBarBg)),
                                                      onTap: () {},
                                                      leading: Text(
                                                          "${index + 1} -",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 30,
                                                              color: CustomColor
                                                                  .appBarBg)),
                                                      trailing: SizedBox(
                                                        width: 140,
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                var modified = model
                                                                    ?.sId
                                                                    ?.replaceAll(
                                                                        '"',
                                                                        '');
                                                                String url =
                                                                    "/admin/news/edit/$modified";
                                                                Get.rootDelegate
                                                                    .toNamed(
                                                                        url);
                                                              },
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: CustomColor
                                                                        .appBarBg,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.0,
                                                                        vertical:
                                                                            5),
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .edit_note_sharp,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                CustomColor.bgColor)),
                                                                  )),
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            GestureDetector(
                                                              onTap: () {
                                                                newController
                                                                    .deleteNew(
                                                                        model?.sId ??
                                                                            "");
                                                              },
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: CustomColor
                                                                        .appBarBg,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.0,
                                                                        vertical:
                                                                            5),
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .delete_outline,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                CustomColor.bgColor)),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                      }),
                                      const SizedBox(height: 40),
                                      GestureDetector(
                                        onTap: () => Get.rootDelegate
                                            .toNamed("/admin/news"),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CustomColor.appBarBg,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 12),
                                            child: Text(
                                              "Tümünü Gör",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: CustomColor.bgColor),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          constraints.maxWidth >= kMinDesktopWidth
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustomColor.appBarBg,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                        color: CustomColor.bgColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Column(
                                          children: [
                                            const Center(
                                              child: Text(
                                                "Talepler",
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 40,
                                                    color:
                                                        CustomColor.appBarBg),
                                              ),
                                            ),
                                            Obx(() {
                                              return contactController
                                                      .isLoadingContacts.value
                                                  ? const CircularProgressIndicator()
                                                  : ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: contactController
                                                          .getContactsItemCount(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        var model = contactController
                                                            .contactResponseModel
                                                            .value
                                                            .contacts?[index];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      8.0),
                                                          child: ListTile(
                                                            title: Text(
                                                                model?.email ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        24,
                                                                    color: CustomColor
                                                                        .appBarBg)),
                                                            onTap: () {},
                                                            subtitle: const Text(
                                                                "27.03.3003",
                                                                style: TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12,
                                                                    color: CustomColor
                                                                        .appBarBg)),
                                                            leading: Text(
                                                                "${index + 1} -",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        30,
                                                                    color: CustomColor
                                                                        .appBarBg)),
                                                            trailing: SizedBox(
                                                              width: 70,
                                                              height: 60,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  contactController
                                                                      .deleteContact(
                                                                          model?.sId ??
                                                                              "");
                                                                },
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          color:
                                                                              CustomColor.appBarBg,
                                                                        ),
                                                                        child:
                                                                            const Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 20.0,
                                                                              vertical: 5),
                                                                          child:
                                                                              Center(child: Icon(Icons.delete_outline, size: 20, color: CustomColor.bgColor)),
                                                                        )),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                            }),
                                            const SizedBox(height: 40),
                                            GestureDetector(
                                              onTap: () => Get.rootDelegate
                                                  .toNamed("/admin/contacts"),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: CustomColor.appBarBg,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 12),
                                                  child: Text(
                                                    "Tümünü Gör",
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                        color: CustomColor
                                                            .bgColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const Column(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : getBody();
      });
    });
  }

  getBody() {
    if (authController.isWantRegister.value) {
      return getRegisterBody();
    } else if (authController.isWantForgot.value) {
      return getResetPassBody();
    } else {
      return getLoginBody();
    }
  }

  getLoginBody() {
    return Center(
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          color: CustomColor.appBarBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Infinito Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: CustomColor.bgColor)),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.userName.value = value;
                    authController.checkForm();
                  },
                  controller: userNameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Kullanıcı Adı",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.password.value = value;
                    authController.checkForm();
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Şifre",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  authController.isWantForgot.value = true;
                },
                child: SizedBox(
                  width: 260,
                  child: Row(
                    children: [
                      Text("Şifremi Unuttum",style: TextStyle(color: CustomColor.whitePrimary,fontSize: 14),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 260,
                child: Row(
                  children: [
                    Obx(() => Checkbox(
                        value: authController.rememberMe.value,
                        onChanged: (bool? newValue) {
                          authController.rememberMe.value = newValue!;
                        })),
                    Text(
                      "Beni hatırla",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: authController.isFormValid.value
                    ? () async {
                        await authController.login();
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.bgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 90.0, vertical: 12),
                    child: !authController.isLoading.value
                        ? const Text(
                            "Gönder",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: CustomColor.appBarBg),
                          )
                        : CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 260,
                child: GestureDetector(
                  onTap: (){
                    authController.isWantRegister.value = true;
                  },
                  child: Center(child: Text("Kayıt ol",
                    style: TextStyle(color: Colors.white,
                        decoration: TextDecoration.underline),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getRegisterBody() {
    return Center(
      child: Container(
        height: 570,
        decoration: BoxDecoration(
          color: CustomColor.appBarBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Infinito Register",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: CustomColor.bgColor)),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.userNameRegister.value = value;
                    authController.checkFormForRegister();
                  },
                  controller: userNameControllerRegister,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Kullanıcı Adı",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.passwordRegister.value = value;
                    authController.checkFormForRegister();
                  },
                  controller: passwordControllerRegister,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Şifre",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.repasswordRegister.value = value;
                    authController.checkFormForRegister();
                  },
                  controller: repasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Yeniden Giriniz",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.securityQuestion.value = value;
                    authController.checkFormForRegister();
                  },
                  controller: securityQuestionController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.security,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "İlk Evcil Hayvanınızın adı",
                    labelStyle: const TextStyle(
                        fontSize: 10,
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: authController.isFormValidRegister.value
                    ? () async {
                  await authController.register();
                }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.bgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 90.0, vertical: 12),
                    child: !authController.isLoading.value
                        ? const Text(
                      "Gönder",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: CustomColor.appBarBg),
                    )
                        : CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 260,
                child: GestureDetector(
                  onTap: (){
                    authController.isWantRegister.value = false;
                  },
                  child: Center(child: Text("Giriş Yap",
                    style: TextStyle(color: Colors.white,
                        decoration: TextDecoration.underline),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getResetPassBody() {
    return Center(
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: CustomColor.appBarBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Infinito Reset Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: CustomColor.bgColor)),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.userNameForgot.value = value;
                    authController.checkFormForgot();
                  },
                  controller: forgotuserNameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Kullanıcı Adı",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.passwordForgot.value = value;
                    authController.checkFormForgot();
                  },
                  controller: forgotpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "Yeni Şifre",
                    labelStyle: const TextStyle(
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 260,
                child: TextFormField(
                  onChanged: (String value) {
                    authController.securityQuestion.value = value;
                    authController.checkFormForgot();
                  },
                  controller: securityQuestionControllerForgot,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: CustomColor.appBarBg,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                    labelText: "İlk Evcil Hayvanınızın adı",
                    labelStyle: const TextStyle(
                        fontSize: 10,
                        color: CustomColor.appBarBg,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: authController.isFormValidForgot.value
                    ? () async {
                  await authController.resetPassword();
                  securityQuestionController.clear();
                  forgotpasswordController.clear();
                  forgotuserNameController.clear();
                }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.bgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 90.0, vertical: 12),
                    child: !authController.isLoading.value
                        ? const Text(
                      "Sıfırla",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: CustomColor.appBarBg),
                    )
                        : CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 260,
                child: GestureDetector(
                  onTap: (){
                    authController.isWantRegister.value = false;
                    authController.isWantForgot.value = false;
                  },
                  child: Center(child: Text("Giriş Yap",
                    style: TextStyle(color: Colors.white,
                        decoration: TextDecoration.underline),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
