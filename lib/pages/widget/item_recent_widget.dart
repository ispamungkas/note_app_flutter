import 'package:flutter/material.dart';
import 'package:note_app/pages/widget/item_note_recent.dart';

class ItemRecentWidget extends StatelessWidget {
  const ItemRecentWidget({super.key, required this.datas});

  final List<String> datas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: datas
                .map(
                  (e) => ItemNoteRecent(),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
