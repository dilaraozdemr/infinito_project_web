class AddContactRequestModel {
  String? name;
  String? email;
  String? message;

  AddContactRequestModel({this.name, this.email, this.message});

  AddContactRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['message'] = this.message;
    return data;
  }
}