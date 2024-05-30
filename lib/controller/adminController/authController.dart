import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:infinito_project_web/constant/colors.dart';

import '../../models/AuthResponseModel.dart';

class AuthController extends GetxController {
  var authResponseModel = AuthResponseModel().obs;

  var isValidCreatePoll = false.obs;
  var visitorsCount = 0.0.obs;
  var activeUsersCount = 0.0.obs;
  final box = GetStorage();
  var userName = "".obs;
  var password = "".obs;

  var userNameRegister = "".obs;
  var passwordRegister = "".obs;
  var repasswordRegister = "".obs;

  var userNameForgot = "".obs;
  var passwordForgot = "".obs;
  var securityQuestion = "".obs;

  var isFormValidForgot = false.obs;
  var isWantForgot = false.obs;

  var rememberMe = false.obs;

  var isFormValid = false.obs;

  var isFormValidRegister = false.obs;
  var isLoading = false.obs;
  var isLogined = false.obs;
  var isWantRegister = false.obs;

    checkForm() {
    isFormValid.value = userName.isNotEmpty && password.isNotEmpty;
  }

  checkFormForRegister() {
    isFormValidRegister.value = userNameRegister.isNotEmpty &&
        passwordRegister.value.isNotEmpty &&
        repasswordRegister.value.isNotEmpty &&
        (passwordRegister.value == repasswordRegister.value);
  }

  checkFormForgot() {
    isFormValidForgot.value = userNameForgot.isNotEmpty &&
        passwordForgot.value.isNotEmpty &&
        securityQuestion.value.isNotEmpty;
  }

  Future<bool> login() async {
    isLoading.value = true;
    final Map<String, String> credentials = {
      'userName': userName.value,
      'password': password.value,
    };
    var url = "http://localhost:4000/api/adminLogin";
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(credentials),
    );
    print(response.body);
    if (response.statusCode == 200) {
      showSnackBar(response);
      isLoading.value = false;

      var model = AuthResponseModel.fromJson(json.decode(response.body));
      authResponseModel.value = model;
      if (rememberMe.value) {
        box.write("userName", authResponseModel.value.admin?.userName ?? "");
        box.write("id", authResponseModel.value.admin?.id ?? "");
        box.write("token", authResponseModel.value.token ?? "");
      }
      isLogined.value = true;
      //await  getActiveUsers();
      return true;
    } else {
      showSnackBar(response);

      isLoading.value = false;
      isLogined.value = false;
      box.write("isLogined", false);
      box.write("userName", "");
      box.write("id", "");
      box.write("token", "");
      print('Failed to send Login: ${response.reasonPhrase}');
      return false;
    }
  }

  checkLogin() async {
    if (box.read("userName") != null) {
      if (box.read("userName") != "") {
        isLogined.value = true;
        authResponseModel.value = AuthResponseModel(
            token: box.read("token"),
            admin: Admin(userName: box.read("userName"), id: box.read("id")));
        //await getActiveUsers();
      } else {
        isLogined.value = false;
      }
    } else {
      isLogined.value = false;
    }
  }

  disconnect() {
    isLogined.value = false;
    box.write("isLogined", false);
    box.write("userName", "");
    box.write("id", "");
    rememberMe.value = false;
    authResponseModel.value = AuthResponseModel();
  }

  register() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    final Map<String, String> credentials = {
      'userName': userNameRegister.value,
      'password': passwordRegister.value,
      'securityQuestion':securityQuestion.value
    };

    var url = "http://localhost:4000/api/adminRegister";

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(credentials),
    );
    if (response.statusCode == 201) {
      showSnackBar(response);
      print('register Success');
      isLoading.value = false;

      var json2 = json.decode(response.body);
      print(json2);
      isWantRegister.value = false;
      var model = AuthResponseModel.fromJson(json.decode(response.body));
    } else {
      isLoading.value = false;
      showSnackBar(response);
    }
  }

  Future<bool> resetPassword() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    final Map<String, String> credentials = {
      'userName': userNameForgot.value,
      'newPassword': passwordForgot.value,
      'securityQuestion': securityQuestion.value,
    };

    var url = "http://localhost:4000/api/reset-password";

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(credentials),
    );
    if (response.statusCode == 200) {
      showSnackBar(response);
      print('resetPass Success');
      isLoading.value = false;
      isWantForgot.value = false;
      isWantRegister.value = false;
      return true;
    } else {
      isLoading.value = false;
      showSnackBar(response);
      return false;
    }
  }

  refreshInputs() {}

  showSnackBar(http.Response response) {
    var json = jsonDecode(response.body);
    var message = json["message"];
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.white,
        titleText: Text(
          response.statusCode == 200 || response.statusCode == 201
              ? "Başarılı"
              : "Başarısız",
          style: TextStyle(
              color: CustomColor.appBarBg, fontWeight: FontWeight.bold,fontSize: 15),
        ),
        messageText: Text(
          message,
          style: TextStyle(color: CustomColor.appBarBg),
        ),
        icon: const Icon(Icons.login),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
