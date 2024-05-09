import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinito_project_web/constant/colors.dart';

class LoginPage extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: CustomColor.appBarBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Infinito Login",
                style:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 40, color: CustomColor.bgColor)),
                const SizedBox(height: 40),
                SizedBox(
                  height: 60,
                  width: 260,
                  child: TextFormField(
                    controller: widget.emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),
      
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: CustomColor.appBarBg,
                      ),
                      filled: true,
                      fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                      labelText: "Kullanıcı Adı",
                      labelStyle: const TextStyle(color: CustomColor.appBarBg, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 260,
                  child: TextFormField(
                    controller: widget.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),
      
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: CustomColor.appBarBg,
                      ),
                      filled: true,
                      fillColor: Color(0xffF6F5F2).withOpacity(0.9),
                      labelText: "Şifre",
                      labelStyle: const TextStyle(color: CustomColor.appBarBg, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(color: CustomColor.bgColor, borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 12),
                      child: Text("Gönder", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,  color: CustomColor.appBarBg),),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      );
  }
}
