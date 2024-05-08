import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/colors.dart';

class ContactMobile extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();
  ContactMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomColor.appBarBg, width: 1),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Bizimle",
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                    const Text(
                      "İletişime",
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                    const Text(
                      "Geçin",
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                    const SizedBox(height: 50,),
                    Lottie.asset("assets/icon/contact_lottie.json", width: 150, height: 150),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),

                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: CustomColor.appBarBg,
                          ),
                          filled: true,
                          fillColor: Color(0xff7AA2E3).withOpacity(0.2),
                          labelText: "Ad-Soyad",
                          labelStyle: const TextStyle(color: CustomColor.appBarBg, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: CustomColor.appBarBg,
                          ),
                          fillColor: Color(0xff7AA2E3).withOpacity(0.2),
                          filled: true,
                          labelText: "Email",
                          labelStyle: const TextStyle(color: CustomColor.appBarBg, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color:Color(0xff7AA2E3).withOpacity(0.2),
                      ),
                      child: TextField(
                        controller: noteController,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16,  color: CustomColor.appBarBg),
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: "Mesajınızı yazınız...",
                          contentPadding: EdgeInsets.all(20.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(color: CustomColor.appBarBg, borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 12),
                          child: Text("Gönder", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,  color: CustomColor.bgColor),),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
