class AddProjectRequestModel {
  String? name;
  String? description;
  List<String>? images;

  AddProjectRequestModel({this.name, this.description, this.images});

  AddProjectRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    return data;
  }
}