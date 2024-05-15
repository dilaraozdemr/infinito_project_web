import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/NewResponseModel.dart';

class NewControllerHome{
  var newResponseModel = NewResponseModel().obs;
  var isLoadingNews = false.obs;
  var newImage = Uint8List(0).obs;
  var newImageUrl = "".obs;
  var isNewLoading = false.obs;
  var newTitle = "".obs;
  var newDescription = "".obs;
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
}