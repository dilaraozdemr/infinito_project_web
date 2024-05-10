class ProjectResponseModel {
  List<Project>? projects;

  ProjectResponseModel({this.projects});

  ProjectResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects!.add(new Project.fromJson(v));
      });
    }
    else{
      projects = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Project {
  String? sId;
  String? name;
  String? description;
  List<String>? images;
  int? iV;

  Project({this.sId, this.name, this.description, this.images, this.iV});

  Project.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['__v'] = this.iV;
    return data;
  }
}