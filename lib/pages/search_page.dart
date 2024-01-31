import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/pages/detail_page.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crud = Get.put(CrudNoteController());

    Widget customAppbar() => SafeArea(
          child: Hero(
            tag: "c",
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 20, top: 15, bottom: 5),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    autofocus: true,
                    controller: crud.searchTextEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Search notes ..",
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                        size: 25,
                      ),
                      hintStyle: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        color: Colors.grey,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

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
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: customAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: crud.searchItem().map((e) => itemList(NoteModel.second().fromJson(e))).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
