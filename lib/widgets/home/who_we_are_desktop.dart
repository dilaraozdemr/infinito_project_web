import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class WhoWeAreDesktop extends StatelessWidget {
  const WhoWeAreDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Infinito Design", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
          const SizedBox(height: 60,),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Biz Kimiz?",style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),),
                     SizedBox(height: 10,),
                     Row(
                      children: [
                        Flexible(
                          child: Column(children: [
                            Text(
                                "Infinito Design, estetik ve işlevselliği bir araya getiren yaratıcı iç mekan çözümleri sunan bir iç mimarlık firmasıdır. Deneyimli ve tutkulu ekibimiz, her projede mükemmelliği hedefleyerek, yaşam alanlarını ve ticari mekanları daha konforlu, şık ve kullanışlı hale getirmek için çalışmaktadır. Modern tasarım anlayışımızı, müşterilerimizin bireysel ihtiyaçları ve zevkleri ile harmanlayarak özgün ve yenilikçi projelere imza atıyoruz.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25,),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Misyonumuz",style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),),
                     SizedBox(height: 10,),
                     Row(
                      children: [
                        Flexible(
                          child: Column(children: [
                            Text(
                                "Infinito Design olarak misyonumuz, müşterilerimize hayallerindeki yaşam ve çalışma alanlarını yaratmada yardımcı olmaktır. Estetik değerleri yüksek, işlevselliği ön planda tutan, sürdürülebilir ve yenilikçi tasarımlar sunarak, her projemizde müşteri memnuniyetini en üst düzeye çıkarmayı amaçlıyoruz. Kaliteli hizmet anlayışımızla, sektörde güvenilir ve öncü bir firma olmayı hedefliyoruz.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25,),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vizyonumuz",style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Flexible(
                          child: Column(children: [
                            Text(
                              "Infinito Design olarak vizyonumuz, iç mimarlık alanında ulusal ve uluslararası düzeyde tanınan, yenilikçi ve öncü bir marka olmaktır. Tasarımda mükemmelliği ve sürdürülebilirliği esas alarak, her projede fark yaratan, trendleri belirleyen ve müşteri beklentilerini aşan çözümler sunmayı hedefliyoruz. Geleceğin yaşam alanlarını bugünden tasarlayarak, sektörde örnek alınan ve ilham veren bir iç mimarlık firması olmayı amaçlıyoruz.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(children: [
            Expanded(child: CachedNetworkImage(
              imageUrl: "assets/image/oda_View06.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
            const SizedBox(width: 10,),
            Expanded(child: CachedNetworkImage(
              imageUrl: "assets/image/oda_View08.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
            const SizedBox(width: 10,),
            Expanded(child: CachedNetworkImage(
              imageUrl: "assets/image/oda_View09.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
          ],)
        ],
      ),
    );
  }
}
