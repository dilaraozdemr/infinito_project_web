import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:infinito_project_web/constant/colors.dart';
import 'package:infinito_project_web/widgets/site_dark_logo.dart';

import '../../constant/size.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  child: const Row(
                    children: [
                      SiteDarkLogo(),
                      Expanded(
                        child: Center(
                          child: Text("Admin Paneli",
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 40,
                                color: CustomColor.appBarBg),),
                        ),
                      ),
                    ],
                  ),
                ),
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
                          onTap: ()=> Get.toNamed("/admin/add/projects"),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomColor.appBarBg,
                                  width: 2),
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
                              padding:  EdgeInsets.symmetric(vertical: 10.0),
                              child:  Center(
                                child: Text("Proje Ekle",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 35,
                                      color: CustomColor.bgColor),),
                              ),
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
                            border: Border.all(color: CustomColor.appBarBg,
                                width: 2),
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
                            padding:  EdgeInsets.symmetric(vertical: 10.0),
                            child:  Center(
                              child: Text("Duyuru Ekle",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 35,
                                    color: CustomColor.bgColor),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    constraints.maxWidth >= kMinDesktopWidth
                        ?
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.appBarBg,
                                width: 2),
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
                            padding:  EdgeInsets.symmetric(vertical: 10.0),
                            child:  Center(
                              child: Text("İletişim",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 35,
                                    color: CustomColor.bgColor),),
                            ),
                          ),
                        ),
                      ),
                    ):Column(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                          title: const Text("Proje",
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24,
                                                  color: CustomColor.appBarBg)),
                                          onTap: () {},
                                          subtitle: const Text("27.03.3003",style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: CustomColor.appBarBg)),
                                          leading: const Text("1 -",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30,
                                                  color: CustomColor.appBarBg)),
                                          trailing: SizedBox(
                                            width: 140,
                                            height: 60,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
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
                                                  onTap: () {},
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
                                                                .delete_outline,
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
                                    }),
                                const SizedBox(height: 40),
                                GestureDetector(
                                  onTap: ()=> Get.toNamed("/admin/projects"),
                                  child: Container(
                                    decoration: BoxDecoration(color: CustomColor.appBarBg, borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                                      child: Text("Tümünü Gör",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500, fontSize: 20,  color: CustomColor.bgColor),),
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
                            child: Column(
                              children: [
                                const Center(
                                  child: Text("Duyurular",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 40,
                                        color: CustomColor.appBarBg),),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                          title: const Text("Duyuru",
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24,
                                                  color: CustomColor.appBarBg)),
                                          onTap: () {},
                                          subtitle: const Text("27.03.3003",style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: CustomColor.appBarBg)),
                                          leading: const Text("1 -",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30,
                                                  color: CustomColor.appBarBg)),
                                          trailing: SizedBox(
                                            width: 140,
                                            height: 60,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
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
                                                  onTap: () {},
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
                                                                .delete_outline,
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
                                    }),
                                const SizedBox(height: 40),
                                GestureDetector(
                                  onTap: ()=> Get.toNamed("/admin/news"),
                                  child: Container(
                                    decoration: BoxDecoration(color: CustomColor.appBarBg, borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                                      child: Text("Tümünü Gör",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500, fontSize: 20,  color: CustomColor.bgColor),),
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
                                  child: Text("Talepler",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 40,
                                        color: CustomColor.appBarBg),),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                          title: const Text("İletişim",
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24,
                                                  color: CustomColor.appBarBg)),
                                          onTap: () {},
                                          subtitle: const Text("27.03.3003",style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: CustomColor.appBarBg)),
                                          leading: const Text("1 -",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30,
                                                  color: CustomColor.appBarBg)),
                                          trailing: SizedBox(
                                            width: 140,
                                            height: 60,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
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
                                                  onTap: () {},
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
                                                                .delete_outline,
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
                                    }),
                                const SizedBox(height: 40),
                                GestureDetector(
                                  onTap: ()=> Get.toNamed("/admin/contacts"),
                                  child: Container(
                                    decoration: BoxDecoration(color: CustomColor.appBarBg, borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                                      child: Text("Tümünü Gör",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500, fontSize: 20,  color: CustomColor.bgColor),),
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
        );
      }
    );
  }
}
