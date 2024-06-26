import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/widgets/site_light_logo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/colors.dart';

class FooterDesktop extends StatelessWidget {
  final Uri _url = Uri.parse('https://www.instagram.com/infinitodesignproject?igsh=MXFqYnRoODM4MjV1Mg%3D%3D&utm_source=qr');
  FooterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.appBarBg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SiteLightLogo(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Follow us : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: CustomColor.bgColor),),
                          const SizedBox(width: 10,),
                          Image.asset("assets/image/gray_mail.png", width: 80),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){ _launchUrl();},
                              child: Image.asset("assets/image/gray_instagram.png", width: 50)),
                          const SizedBox(width: 10,),
                          Image.asset("assets/image/whatsapp.png", width: 50),
                          const SizedBox(width: 10,),
                          Image.asset("assets/image/gray_linkedin.png", width: 50),
                          const SizedBox(width: 10,),
                          Image.asset("assets/image/gray_youtube.png", width: 50),
                        ],
                      ),
                      const Text("Adres : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: CustomColor.bgColor),),
                      const Text("Yeşil Mahalle Avukat Osman \nSokak No:45 Kat7 Merkez/Zonguldak", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: CustomColor.bgColor),),
                      const SizedBox(height: 10),
                      const Text("Telefon : +90 123 123 1234", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: CustomColor.bgColor),),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          Get.defaultDialog(content: Image.asset("assets/image/sitemap.jpeg",width: 800, height: 750,),title: "");
                        },
                          child: const Text("Site Map", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: CustomColor.bgColor),))
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Sitenin tüm hakları Infinito Project' e aittir.", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: CustomColor.bgColor,),),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
