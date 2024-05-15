import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../../models/ProjectResponseModel.dart';

class ProjectControllerHome extends GetxController{

  var isLoadingHomeProjects = false.obs;
  var projectsResponseModel = ProjectResponseModel().obs;

  getProjectsHome() async{
    isLoadingHomeProjects.value = true;
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
      isLoadingHomeProjects.value = false;
      return response.body;
    } else {
      print('Failed to get project: ${response.reasonPhrase}');
      isLoadingHomeProjects.value = false;
      return "";
    }
  }

  getProjectsItemCountHome(){
    if(projectsResponseModel.value.projects!.length <= 8){
      return projectsResponseModel.value.projects!.length;
    }else{
      return 8;
    }
  }
}