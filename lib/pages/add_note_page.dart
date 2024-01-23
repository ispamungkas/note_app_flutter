import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';
import 'package:note_app/utils/custom_menu.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    final get = Get.put(NoteController());

    return Material(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: appBarFlexible(context, title),
          toolbarHeight: 80,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    style: CustomStyle.titleMedium(context),
                    controller: get.subjectInputController,
                    decoration: InputDecoration(
                        label: Text(
                          "Subject",
                          style: CustomStyle.titleMedium(context),
                        ),
                        border: InputBorder.none,
                        hintText: "Input Subject",
                        hintStyle: CustomStyle.titleMediumGrey(context)),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                const CustomDropdown(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarFlexible(BuildContext context, String title) => SafeArea(
        child: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              title,
              style: CustomStyle.titleLarge(context),
            ),
          ),
        ),
      );
}
