import 'package:flutter/material.dart';

class WhoWeAreHomeMobile extends StatelessWidget {
  const WhoWeAreHomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Text(
            "Infinito Project",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Biz Kimiz?",style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Flexible(
                    child: Column(children: [
                      Text(
                        "This text is so long and long and long adslfhjsdkfhjksdhfjkdshfjkhsjkfhsdkn şldfjglsdkf şlzdfsglsdkfglksdflş klfsjgklsfdjgkldf kljfdgkljsdfklgjsdflk lkdfjgklsdfjglkd lskdfjgklsdfbd long and long and that's why it is not wrapping to next line.", style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black
                      ),)
                    ]),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Center(child: Image.asset("assets/image/home.jpeg", fit: BoxFit.cover,width: 300,)),              ],
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Misyonumuz",style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Flexible(
                    child: Column(children: [
                      Text(
                        "This text is ssdafsfasfdasfas lksdjflkasdjflk ljsdfkvlgjadfkgjdlk lksdjgklafdjgalkfd ldfkagjdaklfjglakdf lkdfjgkldafjgkldf adlkfgjkaldfgjldfasfsdfasfddsakfjaksdjfksdjfkldso long and long and long and long and long and that's why it is not wrapping to next line.", style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black
                      ),)
                    ]),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Center(child: Image.asset("assets/image/home.jpeg", fit: BoxFit.cover,width: 300,)),],
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Vizyonumuz",style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Flexible(
                    child: Column(children: [
                      Text(
                        "This text is so long and long and long and long and long  dslfjklsdj klsdafkjklasdjkl jlkjadfklvjkl klah vdklj lıurekjfgh ıukgherqıughqerug chqerluıgqeluı equrgıqer gıequr gıque gkerhand that's why it is not wrapping to next line.", style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black
                      ),)
                    ]),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Center(child: Image.asset("assets/image/home.jpeg", fit: BoxFit.cover,width: 300,)),
            ],
          )
        ],
      ),
    );
  }
}
