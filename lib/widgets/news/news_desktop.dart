import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/controller/homeController/newControllerHome.dart';

import '../../constant/colors.dart';

class NewsDesktop extends StatefulWidget {
  const NewsDesktop({super.key});

  @override
  State<NewsDesktop> createState() => _NewsDesktopState();
}

class _NewsDesktopState extends State<NewsDesktop> {
  NewControllerHome newControllerHome = Get.put(NewControllerHome());

  @override
  void initState() {
    super.initState();
    newControllerHome.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                        newControllerHome.newResponseModel.value
                            .news?.length ?? 0, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: CustomColor.appBarBg, width: 1),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    newControllerHome.newResponseModel.value.news?[index].name ?? "", style: const TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 34
                                  ),
                                  ),
                                  Flexible(
                                    child: Column(
                                        children: [
                                          Text(
                                            newControllerHome.newResponseModel.value.news?[index].description ?? "", style: const TextStyle(
                                              fontWeight: FontWeight.w400, fontSize: 18
                                          ),)
                                        ]),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(
                                            newControllerHome.newResponseModel.value.news?[index].image ?? "",
                                            fit: BoxFit.cover,
                                            width: 150,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    }),
                  );
          }),
        ],
      ),
    );
  }
}
