import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/pages/widget/item_note_recent.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ItemRecentWidget extends StatelessWidget {
  const ItemRecentWidget(
      {super.key, required this.datas, required this.handleNavigate});
  final Function(NoteModel value) handleNavigate;

  final List datas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      child: (datas.isNotEmpty)
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: datas
                      .map(
                        (e) => ItemNoteRecent(
                          dataNoteModel: NoteModel.second().fromJson(e),
                          handleNavigate: (v) {
                            handleNavigate(v);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          : Center(
              child: Text(
                "Empty Note",
                style: CustomStyle.titleMedium(context),
              ),
            ),
    );
  }
}
