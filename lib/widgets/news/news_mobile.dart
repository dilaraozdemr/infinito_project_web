import 'package:flutter/material.dart';

import '../../constant/colors.dart';
class NewsMobile extends StatelessWidget {
  const NewsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Duyurular", style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 40
          ),),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.appBarBg, width: 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Duyuru 1", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25
                            ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/home.jpeg',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.appBarBg, width: 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Duyuru 1", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25
                            ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/home.jpeg',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.appBarBg, width: 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Duyuru 1", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25
                            ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/home.jpeg',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.appBarBg, width: 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Duyuru 1", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25
                            ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/home.jpeg',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.appBarBg, width: 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Duyuru 1", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25
                            ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "This text is ssdafsfasfdasfasfasfsdfasfdweşrıthqeruhfqkeljdhfjqkehfjkldahfkjdshfkjasdhfjkhasdjkf lkdfjkasdfjkdsjfklsajflkasd klsdfjkdsjfklajflkasddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14
                            ),)
                          ]),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/home.jpeg',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
