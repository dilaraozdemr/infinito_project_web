import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/colors.dart';

class WhoWeAreHomeDesktop extends StatelessWidget {
  const WhoWeAreHomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("Infinito Project", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),)),
          const SizedBox(height: 60,),
          const Text("Biz Kimiz?",style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: CustomColor.appBarBg),),
          const SizedBox(height: 10,),
          const Row(
            children: [
              Flexible(
                child: Column(children: [
                  Text(
                    "Infinito Design, estetik ve işlevselliği bir araya getiren yaratıcı iç mekan çözümleri sunan bir iç mimarlık firmasıdır. Deneyimli ve tutkulu ekibimiz, her projede mükemmelliği hedefleyerek, yaşam alanlarını ve ticari mekanları daha konforlu, şık ve kullanışlı hale getirmek için çalışmaktadır. Modern tasarım anlayışımızı, müşterilerimizin bireysel ihtiyaçları ve zevkleri ile harmanlayarak özgün ve yenilikçi projelere imza atıyoruz.\nİç mimarımız Hakan Bey daha önce çalıştığı firmalarda da birçok projeye imza atarak başarısına başarı katmıştır. Yoluna kendi devam etmeye karar verdiği noktada Infinito Design 'ın ilk adımları atılmıştır.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black
                    ),)
                ]),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(120),
                        child: Image.asset("assets/image/who1.jpeg"))),
                const SizedBox(width: 20,),
                const Text(
                  "Dilara Özdemir", style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                ),),
                const SizedBox(width: 20,),
                const Text(
                  "Yazılım Mühendisi", style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                ),)
              ],
            ),
            const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(120),
                          child: Image.asset("assets/image/who1.jpeg"))),
                  const SizedBox(width: 20,),
                  const Text(
                    "Dilara Özdemir", style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                  ),),
                  const SizedBox(width: 20,),
                  const Text(
                    "İç Mimar", style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                  ),),
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(120),
                          child: Image.asset("assets/image/who1.jpeg"))),
                  const SizedBox(width: 20,),
                  const Text(
                    "Dilara Özdemir", style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                  ),),
                  const SizedBox(width: 20,),
                  const Text(
                    "Sosyal Medya Sorumlusu", style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black
                  ),)
                ],
              ),
          ],)
        ],
      ),
    );
  }
}
