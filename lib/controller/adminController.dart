import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary/cloudinary.dart';
import 'package:get/get.dart';
import 'package:infinito_project_web/models/AddNewRequestModel.dart';
import 'package:infinito_project_web/models/AddProjectRequestModel.dart';
import 'package:infinito_project_web/models/NewResponseModel.dart';
import 'package:infinito_project_web/models/ProjectResponseModel.dart';
import 'package:infinito_project_web/models/SingleNewResponseModel.dart';

import '../models/SingleProjectResponseModel.dart';

class AdminController extends GetxController{
  var isLoadingProjects = false.obs;
  var isLoadingNews = false.obs;
  var projectsResponseModel = ProjectResponseModel().obs;
  var newResponseModel = NewResponseModel().obs;
  //Add Project
  var projectTitle = "".obs;
  var projectDescription = "".obs;
  var imageUrl = <String>[].obs;
  var imageFiles = <Uint8List>[].obs;
  var isLoading = false.obs;
  sendImages() async {
    isLoading.value = true;
    for (var element in imageFiles) {
      var response = await uploadImage(element);
      print(response?.secureUrl);
      if (response?.isSuccessful == false){
        isLoading.value = false;
      }
      imageUrl.add(response?.secureUrl ?? "");
    }
  }
  sendProject()async{
    await sendImages();
    var model = AddProjectRequestModel();
    model.name = projectTitle.value;
    model.description = projectDescription.value;
    model.images = imageUrl.value;
    String jsonQuery = json.encode(model.toJson());

    var url = "http://localhost:4000/api/projects";
    print(jsonQuery);
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonQuery,
    );
    if (response.statusCode == 201) {
      isLoading.value = false;
      print(response.body.toString());
      print('Project send successfully');
      return response.body;
    } else {
      isLoading.value = false;
      print('Failed to send project: ${response.reasonPhrase}');
      return "";
    }
  }

  //Edit Project
  TextEditingController project_name_edit = TextEditingController();
  TextEditingController project_description_edit = TextEditingController();
  var projectTitleForEdit = "".obs;
  var projectDescriptionForEdit = "".obs;
  var imageUrlForEdit = <String>[].obs;
  var imageFilesEdit = <Uint8List>[].obs;
  var isLoadingForEdit = false.obs;
  var isLoadingForSingleProject = false.obs;
  var selectedProject = Project().obs;
  var selectedId = "".obs;
  sendImagesForEdit() async {
    isLoadingForEdit.value = true;
    for (var element in imageFilesEdit) {
      var response = await uploadImage(element);
      print(response?.secureUrl);
      if (response?.isSuccessful == false){
        isLoadingForEdit.value = false;
      }
      imageUrlForEdit.add(response?.secureUrl ?? "");
    }
  }

  //Add New
  var newImage = Uint8List(0).obs;
  var newImageUrl = "".obs;
  var isNewLoading = false.obs;
  var newTitle = "".obs;
  var newDescription = "".obs;
  sendImageForNew() async {
    if(newImage.value.isNotEmpty){
      isNewLoading.value = true;
      var response = await uploadImage(newImage.value);
      print(response?.secureUrl);
      if (response?.isSuccessful == false) {
        isLoading.value = false;
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

  //Edit New
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
  sendImagesForEditNew() async {
    isLoadingForEditNew.value = true;
      var response = await uploadImage(imageFilesEditNew.value);
      print(response?.secureUrl);
      if (response?.isSuccessful == false){
        isLoadingForEdit.value = false;
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

  getProjects() async{
    isLoadingProjects.value = true;
    await Future.delayed(const Duration(seconds: 1));
    var url = "http://localhost:4000/api/projects";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('Project get successfully');
      var model = ProjectResponseModel.fromJson(json.decode(response.body));
      projectsResponseModel.value = model;
      isLoadingProjects.value = false;
      return response.body;
    } else {
      print('Failed to get project: ${response.reasonPhrase}');
      isLoadingProjects.value = false;
      return "";
    }
  }
  getProjectsItemCount(){
    if(projectsResponseModel.value.projects!.length <= 4){
      return projectsResponseModel.value.projects!.length;
    }else{
      return 4;
    }
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

  getProject(String id) async{
    isLoadingForSingleProject.value = true;
    await Future.delayed(const Duration(seconds: 1));
    var url = "http://localhost:4000/api/projects/$id";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('Project get successfully');
      var model = SingleProjectResponseModel.fromJson(json.decode(response.body));
      selectedProject.value = model.project ?? Project();
      project_name_edit.text = model.project?.name ?? "";
      project_description_edit.text = model.project?.description ?? "";
      isLoadingForSingleProject.value = false;
      return response.body;
    } else {
      print('Failed to get project: ${response.reasonPhrase}');
      isLoadingForSingleProject.value = false;
      return "";
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

  deleteProject(String id) async{
    var url = "http://localhost:4000/api/projects/${id}";
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Project delete successfully');
      getProjects();
      return response.body;
    } else {
      print('Failed to delete project: ${response.reasonPhrase}');
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

  updateProject(String id)async{
    await sendImagesForEdit();
    var model = selectedProject.value;
    model.name = project_name_edit.value.text;
    model.description = project_description_edit.value.text;

    List<String> list = [];
    selectedProject.value.images?.forEach((element) {
      list.add(element);
    });

    imageUrlForEdit.value.forEach((element) {
      list.add(element);
    });

    model.images = list;


    String jsonQuery = json.encode(model.toJson());

    var url = "http://localhost:4000/api/projects/$id";
    print(jsonQuery);
    var response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonQuery,
    );

    if (response.statusCode == 200) {
      isLoadingForEdit .value = false;
      print(response.body.toString());
      print('Project send successfully');
      getProjects();
      imageUrlForEdit.clear();
      imageFilesEdit.clear();
      return response.body;
    } else {
      imageUrlForEdit.clear();
      imageFilesEdit.clear();
      isLoadingForEdit.value = false;
      print('Failed to send project: ${response.reasonPhrase}');
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
      getProjects();
      return response.body;
    } else {
      isLoadingForEditNew.value = false;
      print('Failed to updated new: ${response.reasonPhrase}');
      return "";
    }
  }


}