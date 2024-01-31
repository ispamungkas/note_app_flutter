import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

// ignore: must_be_immutable
class ItemNoteWidget extends StatelessWidget {
  ItemNoteWidget({super.key, this.index, required this.noteModel, required this.callback});
  final index;
  NoteModel noteModel;
  Function (NoteModel model) callback;
  bool? toggle = true;

  @override
  Widget build(BuildContext context) {
    Random rand = Random();

    return StaggeredGridTile.count(
      mainAxisCellCount: randomMaxHeight(rand.nextInt(4)),
      crossAxisCellCount: 2,
      child: GestureDetector(
        onTap: () => {
          callback(noteModel)
        },
        child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(CustomColor.background)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [date(context), judul(context), body(context, index)],
                ),
              ),
            )),
      ),
    );
  }

  Widget date(BuildContext context) {
    return Text(
      "${noteModel.tanggal?.day} -> ${noteModel.tanggal?.year}",
      style:
          GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget judul(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        "${noteModel.judul}",
        style: CustomStyle.titleMediumBold(context),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget body(BuildContext context, int index) {
    return Text(
      "${noteModel.deskripsi}",
      style: CustomStyle.bodySmall(context),
      maxLines: (toggle!)? 9 : 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  randomMaxHeight(int value){
    if(index % 2 == value){
      toggle = true;
      return 3;
    }
    toggle = false;
    return 2;
  }
}
