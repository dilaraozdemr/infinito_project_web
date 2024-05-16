import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../controller/homeController/newControllerHome.dart';

class NewsMobile extends StatefulWidget {
  const NewsMobile({Key? key}) : super(key: key);

  @override
  State<NewsMobile> createState() => _NewsMobileState();
}

class _NewsMobileState extends State<NewsMobile> {
  NewControllerHome newControllerHome = Get.put(NewControllerHome());

  @override
  void initState() {
    super.initState();
    newControllerHome.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return newControllerHome.isLoadingNews.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Duyurular", style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 40
            ),),
            const SizedBox(height: 20,),
            Obx(() {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                children: List.generate(
                    newControllerHome.newResponseModel.value
                        .news?.length ?? 0, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: CustomColor.appBarBg, width: 1),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    newControllerHome.newResponseModel.value
                                        .news?[index].name ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 34
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                            children: [
                                              Text(
                                                newControllerHome
                                                    .newResponseModel.value
                                                    .news?[index].description ??
                                                    "", style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18
                                              ),)
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20),
                                          child: CachedNetworkImage(
                                            imageUrl: newControllerHome.newResponseModel
                                                .value.news?[index].image ?? "",
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      );
    });
  }
}
