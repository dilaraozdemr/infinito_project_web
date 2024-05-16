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
                                "This text is so long and long and long adslfhjsdasdfıoghsdıkf akldfgjaklfgjldjgkladf oadfjglısdfjglksdfjg apofgjlşdfjgkladf adlfgjlkadfjglkadfg ladfjglkadjglkadfg oaldjfglkadfgjkfhjksdhfjkdshfjkhsjkfhsdknd long and long and that's why it is not wrapping to next line.", style: TextStyle(
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
                                "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
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
                              "This nd long and long and long and thatewrpotjqweıtjıroetqhjkwehjtqlerştlqwşejtrkejtkeqrhtjklqerhtjkhrqejtkqherjkthrejklthqjkelrhtljkqerhtkjqerhtjkerhtjkerhltqerkjhtjlkerhtkeljr's why it is not wrapping to next line.", style: TextStyle(
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
