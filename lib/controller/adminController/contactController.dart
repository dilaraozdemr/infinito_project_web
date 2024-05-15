import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinito_project_web/models/ContactResponseModel.dart';
class ContactController extends GetxController{

  var isLoadingContacts = false.obs;
  var contactResponseModel = ContactResponseModel().obs;

  getContacts() async{
    isLoadingContacts.value = true;
    await Future.delayed(const Duration(seconds: 1));
    var url = "http://localhost:4000/api/contacts";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('Contact get successfully');
      var model = ContactResponseModel.fromJson(json.decode(response.body));
      contactResponseModel.value = model;
      isLoadingContacts.value = false;
      return response.body;
    } else {
      print('Failed to contact project: ${response.reasonPhrase}');
      isLoadingContacts.value = false;
      return "";
    }
  }
  getContactsItemCount(){
    if(contactResponseModel.value.contacts!.length <= 4){
      return contactResponseModel.value.contacts!.length;
    }else{
      return 4;
    }
  }
  deleteContact(String id) async{
    var url = "http://localhost:4000/api/contacts/${id}";
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Contact delete successfully');
      getContacts();
      return response.body;
    } else {
      print('Failed to delete contact: ${response.reasonPhrase}');
      return "";
    }
  }
}