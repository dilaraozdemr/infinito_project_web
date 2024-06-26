class AuthResponseModel {
  String? message;
  Admin? admin;
  String? token;

  AuthResponseModel({this.message, this.admin, this.token});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Admin {
  String? id;
  String? userName;
  String? securityQuestion;

  Admin({this.id, this.userName, this.securityQuestion});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    securityQuestion = json['securityQuestion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['recoveryKey'] = this.securityQuestion;
    return data;
  }
}