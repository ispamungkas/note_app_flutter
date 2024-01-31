import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

// ignore: must_be_immutable
class ItemNoteRecent extends StatefulWidget {
  ItemNoteRecent({super.key, required this.dataNoteModel, required this.handleNavigate});
  NoteModel dataNoteModel;
  Function (NoteModel value) handleNavigate;

  @override
  State<ItemNoteRecent> createState() => _ItemNoteRecentState();
}

class _ItemNoteRecentState extends State<ItemNoteRecent> {
  @override
  Widget build(BuildContext context) {
    DateTime date = widget.dataNoteModel.tanggal!;

    return GestureDetector(
      onTap: () {
        widget.handleNavigate(widget.dataNoteModel);
      },
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
                    "${widget.dataNoteModel.judul}",
                    style: CustomStyle.titleMediumBold(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.dataNoteModel.deskripsi}",
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
