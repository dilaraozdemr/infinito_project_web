import 'package:flutter/material.dart';

import '../../constant/animated_image.dart';
import '../../constant/colors.dart';

class ProjectsHomeMobile extends StatefulWidget {
  const ProjectsHomeMobile({Key? key}) : super(key: key);

  @override
  State<ProjectsHomeMobile> createState() => _ProjectsHomeMobileState();
}

class _ProjectsHomeMobileState extends State<ProjectsHomeMobile> {
  int hoverIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    padding: const EdgeInsets.all(10),
                    children:
                    List.generate(6, (index) {
                      return HoverContainer(
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
                              child: Image.asset(
                                'assets/image/home.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (hoverIndex == index)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Resim ${index + 1}",
                                    style: const TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                          ],
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
  }
}
