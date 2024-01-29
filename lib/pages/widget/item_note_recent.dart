import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/pages/detail_page.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ItemNoteRecent extends StatelessWidget {
  ItemNoteRecent({super.key, required this.dataNoteModel});
  NoteModel dataNoteModel;

  @override
  Widget build(BuildContext context) {
    DateTime date = dataNoteModel.tanggal!;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => DetailPage(dataModel: dataNoteModel))),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: const Color(CustomColor.background),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${date.day} -> ${date.year}',
                    style: CustomStyle.bodySmall(context),
                  ),
                  Text(
                    "${dataNoteModel.judul}",
                    style: CustomStyle.titleMediumBold(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${dataNoteModel.deskripsi}",
                    style: CustomStyle.bodySmall(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
