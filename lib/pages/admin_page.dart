import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/colors.dart';
import 'package:infinito_project_web/widgets/admin/admin.dart';
import 'package:infinito_project_web/widgets/admin/login.dart';

class AdminPage extends StatefulWidget {
  final isLogin = true;
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: widget.isLogin ? Admin(): LoginPage(),
    );
  }
}
