import 'package:flutter/material.dart';
import 'package:infinito_project_web/widgets/site_logo.dart';

import '../constant/colors.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SiteLogo(onTap: (){}),
                const SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Text("Follow us : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: CustomColor.bgColor),),
                      const SizedBox(width: 10,),
                      Image.asset("assets/image/gray_mail.png", width: 50),
                      const SizedBox(width: 10,),
                      Image.asset("assets/image/gray_instagram.png", width: 30),
                      const SizedBox(width: 10,),
                      Image.asset("assets/image/whatsapp.png", width: 30),
                      const SizedBox(width: 10,),
                      Image.asset("assets/image/gray_linkedin.png", width: 30),
                      const SizedBox(width: 10,),
                      Image.asset("assets/image/gray_youtube.png", width: 30),
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
}
