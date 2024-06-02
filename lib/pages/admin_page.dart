import 'package:flutter/material.dart';
import 'package:infinito_project_web/constant/colors.dart';
import 'package:infinito_project_web/widgets/admin/admin.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Admin()
    );
  }
}
