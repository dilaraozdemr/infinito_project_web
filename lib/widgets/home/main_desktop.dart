import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

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
                    image: AssetImage("assets/image/emreKaya.jpg"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                    image: AssetImage("assets/image/ayo.jpg"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                    image: AssetImage("assets/image/ayo3.jpg"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                    image: AssetImage("assets/image/mutfak.jpg"),
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
        const SizedBox(height: 20),
        const Text("İç Mekanları Sonsuzlaştırın,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
        const Text("Infinito ile Yaratıcı Dokunuşlar!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
        const SizedBox(height: 10),
        const SizedBox(height: 90),
      ],
    );
  }
}
