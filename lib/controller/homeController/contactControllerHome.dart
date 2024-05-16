import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:infinito_project_web/models/AddContactRequestModel.dart';

class ContactControllerHome extends GetxController{
  var contactName = "".obs;
  var isContactLoading = false.obs;
  var contactEmail = "".obs;
  var contactMessage = "".obs;

  sendContact()async{
    isContactLoading.value = true;
    var model = AddContactRequestModel();
    model.name = contactName.value;
    model.email = contactEmail.value;
    model.message = contactMessage.value;
    String jsonQuery = json.encode(model.toJson());

    var url = "http://localhost:4000/api/contacts";
    print(jsonQuery);
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonQuery,
    );
    if (response.statusCode == 201) {
      isContactLoading.value = false;
      print(response.body.toString());
      print('New send successfully');
      Get.snackbar("Başarılı", "Mesaj başarı ile gönderilmiştir.");
      return response.body;
    } else {
      isContactLoading.value = false;
      print('Failed to send new: ${response.reasonPhrase}');
      return "";
    }
  }
}