import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
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
            aspectRatio: 9/3,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(height: 30),
        const Text("İç Mekanları Sonsuzlaştırın,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
        const Text("Infinito ile Yaratıcı Dokunuşlar!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.appBarBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Text("Başlamak İçin Dokun", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: CustomColor.bgColor),),
            ),
          ),
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
