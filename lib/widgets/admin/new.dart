import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/controller/adminController/newController.dart';

import '../../constant/colors.dart';
class NewsAdminPage extends StatefulWidget {
  const NewsAdminPage({Key? key}) : super(key: key);

  @override
  State<NewsAdminPage> createState() => _NewsAdminPageState();
}
class _NewsAdminPageState extends State<NewsAdminPage> {
  NewController newController = Get.put(NewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newController.getNews();
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
                    child: Text("Duyurular",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: CustomColor.appBarBg),),
                  ),
                  Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: newController.newResponseModel.value
                            .news?.length ?? 0,
                        itemBuilder: (context, index) {
                          var model = newController.newResponseModel
                              .value.news?[index];
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
                                        String url = "/admin/news/edit/$modified";
                                        Get.rootDelegate.toNamed(url);
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
                                        newController.deleteNew(
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
