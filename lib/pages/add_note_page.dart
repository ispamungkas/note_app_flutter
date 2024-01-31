import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';
import 'package:note_app/utils/custom_menu.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    // Instance of Note Controller
    // ignore: unused_local_variable
    final get = Get.put(NoteController());
    // Instance of Crud Note Controller;
    final crud = Get.put(CrudNoteController());

    Future<bool> _onPop () async{
      try {
        await crud.clear();
        Navigator.pop(context);
        return true;
      } catch (e) {
        return false;
      }
    }
    
    return WillPopScope(
      onWillPop: () => _onPop(),
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: appBarFlexible(context, title),
            toolbarHeight: 80,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: CustomStyle.titleMedium(context),
                            controller: crud.subjectTextEditingController,
                            decoration: InputDecoration(
                                label: Text(
                                  "Subject",
                                  style: CustomStyle.titleMediumGrey(context),
                                ),
                                border: InputBorder.none,
                                hintText: "Input Subject",
                                hintStyle: CustomStyle.titleMediumGrey(context)),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const CustomDropdown(isCanEdit: true),
                        const Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            maxLines: 15,
                            style: CustomStyle.titleMedium(context),
                            controller: crud.bodyTextEditingController,
                            decoration: InputDecoration(
                              hintText: "Body",
                              hintStyle: CustomStyle.titleMediumGrey(context),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Material(
                      color: const Color(CustomColor.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if (crud.addBook()) {
                            Get.defaultDialog(
                                title: "Notes",
                                middleText:
                                    "Adding Note was Sucessfull at ${DateTime.now()}",
                                backgroundColor: Colors.grey,
                                titleStyle: TextStyle(color: Colors.white),
                                middleTextStyle: TextStyle(color: Colors.white));
                          } else {
                            Get.defaultDialog(
                                title: "Notes",
                                middleText: "Somthing wen't wrong",
                                backgroundColor: Colors.grey,
                                titleStyle: TextStyle(color: Colors.white),
                                middleTextStyle: TextStyle(color: Colors.white));
                          }
                        },
                        child: Center(
                          child: Text(
                            "Add note",
                            style: CustomStyle.titleMediumBoldWhite(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
