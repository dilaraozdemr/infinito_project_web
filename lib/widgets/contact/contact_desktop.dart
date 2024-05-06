import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/colors.dart';
class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: CustomColor.appBarBg, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text("Contact Us", style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 40),),
                ],
              ),
            Lottie.asset("assets/icon/contact_lottie.json", width: 60),
            ],
          )
        ),
      ),
    );
  }
}
