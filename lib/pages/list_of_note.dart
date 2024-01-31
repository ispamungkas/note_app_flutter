import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/pages/detail_page.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ListOfNotePage extends StatelessWidget {
  const ListOfNotePage({super.key});

  @override
  Widget build(BuildContext context) {

    final crudController = Get.put(CrudNoteController());

    Widget itemList(NoteModel noteModel) => GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(dataModel: noteModel,),),),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: Offset(5, 5))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${noteModel.tanggal}',
                    style: CustomStyle.bodySmall(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${noteModel.judul}",
                style: CustomStyle.titleMediumBold(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${noteModel.deskripsi}",
                style: CustomStyle.bodySmall(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(CustomColor.background),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // ignore: invalid_use_of_protected_member
              children: crudController.allBook.value.map((e) => itemList(NoteModel.second().fromJson(e))).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
