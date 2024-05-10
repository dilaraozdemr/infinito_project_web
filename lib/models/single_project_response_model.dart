import 'ProjectResponseModel.dart';

class SingleProjectResponseModel {
  Project? project;

  SingleProjectResponseModel({this.project});

  SingleProjectResponseModel.fromJson(Map<String, dynamic> json) {
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}