import 'dart:convert';
import 'dart:typed_data';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/AddNewRequestModel.dart';
import '../../models/NewResponseModel.dart';
import '../../models/SingleNewResponseModel.dart';

class NewController extends GetxController{
  var newResponseModel = NewResponseModel().obs;
  var isLoadingNews = false.obs;
  var newImage = Uint8List(0).obs;
  var newImageUrl = "".obs;
  var isNewLoading = false.obs;
  var newTitle = "".obs;
  var newDescription = "".obs;
  TextEditingController new_name_edit = TextEditingController();
  TextEditingController new_description_edit = TextEditingController();
  var isLoadingForSingleNew = false.obs;
  var isLoadingForEditNew = false.obs;
  var selectedNew = News().obs;
  var selectedNewId = "".obs;
  var newTitleForEdit = "".obs;
  var newDescriptionForEdit = "".obs;
  var imageUrlForEditNew = "".obs;
  var imageFilesEditNew = Uint8List(0).obs;

  sendImageForNew() async {
    if(newImage.value.isNotEmpty){
      isNewLoading.value = true;
      var response = await uploadImage(newImage.value);
      print(response?.secureUrl);
      if (response?.isSuccessful == false) {
        isNewLoading.value = false;
      }
      newImageUrl.value = response?.secureUrl ?? "";
    }
  }
  sendNew()async{
    await sendImageForNew();
    var model = AddNewRequestModel();
    model.name = newTitle.value;
    model.description = newDescription.value;
    model.image = newImageUrl.value;
    String jsonQuery = json.encode(model.toJson());

    var url = "http://localhost:4000/api/news";
    print(jsonQuery);
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonQuery,
    );
    if (response.statusCode == 201) {
      isNewLoading.value = false;
      print(response.body.toString());
      print('New send successfully');
      return response.body;
    } else {
      isNewLoading.value = false;
      print('Failed to send new: ${response.reasonPhrase}');
      return "";
    }
  }

  sendImagesForEditNew() async {
    isLoadingForEditNew.value = true;
    var response = await uploadImage(imageFilesEditNew.value);
    print(response?.secureUrl);
    if (response?.isSuccessful == false){
      isLoadingForEditNew.value = false;
    }
    else{
      imageUrlForEditNew.value = response?.secureUrl ?? "";
      imageFilesEditNew.value = Uint8List(0);

    }

  }
  final cloudinary =
  Cloudinary.signedConfig(apiKey: "188489993429478",apiSecret: "rLCldE4fhsd2bALQCy7pOERNFRE",cloudName: "douhpv6i7");
  Future<CloudinaryResponse?> uploadImage(Uint8List image) async {
    final response = await cloudinary.upload(
        fileBytes: image,
        resourceType: CloudinaryResourceType.image,
        folder: "/projectsImages");
    return response;
  }
  getNews() async{
    isLoadingNews.value = true;
    await Future.delayed(const Duration(seconds: 1));
    var url = "http://localhost:4000/api/news";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('News get successfully');
      var model = NewResponseModel.fromJson(json.decode(response.body));
      newResponseModel.value = model;
      isLoadingNews.value = false;
      return response.body;
    } else {
      print('Failed to get news: ${response.reasonPhrase}');
      isLoadingNews.value = false;
      return "";
    }
  }
  getNewsItemCount(){
    if(newResponseModel.value.news!.length <= 4){
      return newResponseModel.value.news!.length;
    }else{
      return 4;
    }
  }
  getNew(String id) async{
    isLoadingForSingleNew.value = true;
    await Future.delayed(const Duration(seconds: 1));
    var url = "http://localhost:4000/api/news/$id";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('New get successfully');
      var model = SingleNewResponseModel.fromJson(json.decode(response.body));
      selectedNew.value = model.news ?? News();
      new_name_edit.text = model.news?.name ?? "";
      new_description_edit.text = model.news?.description ?? "";
      isLoadingForSingleNew.value = false;
      return response.body;
    } else {
      print('Failed to get new: ${response.reasonPhrase}');
      isLoadingForSingleNew.value = false;
      return "";
    }
  }
  deleteNew(String id) async{
    var url = "http://localhost:4000/api/news/${id}";
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('New delete successfully');
      getNews();
      return response.body;
    } else {
      print('Failed to delete new: ${response.reasonPhrase}');
      return "";
    }
  }
  updateNew(String id)async{
    var newForUpdated = News();
    if(imageFilesEditNew.value.isNotEmpty){
      await sendImagesForEditNew();
      newForUpdated.image = imageUrlForEditNew.value;
      newForUpdated.name = new_name_edit.value.text;
      newForUpdated.description = new_description_edit.value.text;
    }
    else{
      newForUpdated.image = selectedNew.value.image;
      newForUpdated.name = newTitleForEdit.value;
      newForUpdated.description = newDescriptionForEdit.value;
    }

    String jsonQuery = json.encode(newForUpdated.toJson());

    var url = "http://localhost:4000/api/news/$id";
    print(jsonQuery);
    var response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonQuery,
    );
    if (response.statusCode == 200) {
      isLoadingForEditNew .value = false;
      print(response.body.toString());
      print('New updated successfully');
      getNews();
      return response.body;
    } else {
      isLoadingForEditNew.value = false;
      print('Failed to updated new: ${response.reasonPhrase}');
      return "";
    }
  }

}