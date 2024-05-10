import 'dart:typed_data';

import 'package:cloudinary/cloudinary.dart';
import 'package:get/get.dart';

class AdminController extends GetxController{
  var imageFiles = <Uint8List>[].obs;
  final cloudinary =
  Cloudinary.signedConfig(apiKey: "188489993429478",apiSecret: "rLCldE4fhsd2bALQCy7pOERNFRE",cloudName: "douhpv6i7");
  Future<CloudinaryResponse?> uploadImage(Uint8List image) async {
      final response = await cloudinary.upload(
          fileBytes: image,
          resourceType: CloudinaryResourceType.image,
          folder: "/projectsImages");
      return response;
  }
  sendImages(){
    imageFiles.forEach((element) async{
      var response = await uploadImage(element);
      print(response?.secureUrl);
    });
  }
}