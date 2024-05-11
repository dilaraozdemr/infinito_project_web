import 'NewResponseModel.dart';

class SingleNewResponseModel {
  News? news;

  SingleNewResponseModel({this.news});

  SingleNewResponseModel.fromJson(Map<String, dynamic> json) {
    news = json['news'] != null ? new News.fromJson(json['news']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.toJson();
    }
    return data;
  }
}