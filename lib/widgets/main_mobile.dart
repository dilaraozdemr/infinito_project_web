import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShaderMask(
              shaderCallback: (bounds){
                return LinearGradient(colors: [
                  CustomColor.imageShadow.withOpacity(0.6),
                  CustomColor.imageShadow.withOpacity(0.6),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/home.jpeg"),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/home.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/home.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/home.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16/15,
                  enlargeCenterPage: true,
                ),
              )),
          const SizedBox(height: 30),
          const Text("İç Mekanları Sonsuzlaştırın,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
          const Text("Infinito ile Yaratıcı Dokunuşlar!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.appBarBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Text("Başlamak İçin Dokun", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: CustomColor.bgColor),),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
