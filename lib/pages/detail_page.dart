import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/utils/custom_fontstyle.dart';
import 'package:note_app/utils/custom_menu.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DetailPage({super.key, this.dataModel});
  NoteModel? dataModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // Instance of Note Controller
    // ignore: unused_local_variable
    final get = Get.put(NoteController());
    // Instance of Crud Note Controller;
    final crud = Get.put(CrudNoteController());
    ValueNotifier<bool> isReadonly = ValueNotifier<bool>(true);

    crud.addValuetoControllerTextField(
        body: widget.dataModel?.deskripsi,
        subject: widget.dataModel?.judul,
        type: widget.dataModel?.kategori);

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
      child: ValueListenableBuilder(
          valueListenable: isReadonly,
          builder: (context, value, child) {
            return Material(
              child: Scaffold(
                appBar: AppBar(
                  flexibleSpace: appBarFlexible(context, "Detail"),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (await crud.deleteBook(context, widget.dataModel!)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("This note was deleted"),
                              ),
                            );
                            Navigator.of(context).pop(true);
                          }
                        },
                        child: Icon(Icons.delete),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          if (!isReadonly.value) {
                            if (crud.updateNote(widget.dataModel!.toJson())) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Update Successfull")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Something wen't wrong")));
                            }
                            isReadonly.value = !isReadonly.value;
                          } else {
                            isReadonly.value = !isReadonly.value;
                          }
                        },
                        child: Icon((value) ? Icons.edit : Icons.check),
                      ),
                    ),
                  ],
                  toolbarHeight: 80,
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  readOnly: value,
                                  style: CustomStyle.titleMedium(context),
                                  controller: crud.subjectTextEditingController,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Subject",
                                        style:
                                            CustomStyle.titleMediumGrey(context),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Input Subject",
                                      hintStyle:
                                          CustomStyle.titleMediumGrey(context)),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              const CustomDropdown(),
                              const Divider(
                                thickness: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  readOnly: value,
                                  maxLines: 15,
                                  style: CustomStyle.titleMedium(context),
                                  controller: crud.bodyTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Body",
                                    hintStyle:
                                        CustomStyle.titleMediumGrey(context),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
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
