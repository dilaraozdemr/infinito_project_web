import 'package:flutter/material.dart';

import '../../constant/colors.dart';
class ContactsAdminPage extends StatelessWidget {
  const ContactsAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColor.appBarBg,
                width: 2),
            borderRadius: BorderRadius.circular(20),
            color: CustomColor.bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(
                    0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Text("Talepler",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: CustomColor.appBarBg),),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: ListTile(
                            title: const Text("Talep",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: CustomColor.appBarBg)),
                            onTap: () {},
                            subtitle: const Text("27.03.3003",style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: CustomColor.appBarBg)),
                            leading: const Text("1 -",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                    color: CustomColor.appBarBg)),
                            trailing: SizedBox(
                              width: 140,
                              height: 60,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .circular(20),
                                          color: CustomColor
                                              .appBarBg,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets
                                              .symmetric(
                                              horizontal: 20.0,
                                              vertical: 5),
                                          child: Center(
                                              child: Icon(Icons
                                                  .edit_note_sharp,
                                                  size: 20,
                                                  color: CustomColor
                                                      .bgColor)),
                                        )),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .circular(20),
                                          color: CustomColor
                                              .appBarBg,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets
                                              .symmetric(
                                              horizontal: 20.0,
                                              vertical: 5),
                                          child: Center(
                                              child: Icon(Icons
                                                  .delete_outline,
                                                  size: 20,
                                                  color: CustomColor
                                                      .bgColor)),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
