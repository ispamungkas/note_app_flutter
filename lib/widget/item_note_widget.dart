import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ItemNoteWidget extends StatelessWidget {
  final int index;
  const ItemNoteWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          height: (index % 3 + 2) * 70,
          decoration: const BoxDecoration(
            color: Color(CustomColor.background),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [date(context), judul(context), body(context, index)],
            ),
          )),
    );
  }

  Widget date(BuildContext context) {
    return Text(
      "tanggal",
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
        "Ini adalah judul yang bagu sdan hargai semuanya",
        style: CustomStyle.titleMediumBold(context),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget body(BuildContext context, int index) {
    return  Text(
        "ini adalah bodsdfsdfsdd" * 10,
        style: CustomStyle.bodySmall(context),
        maxLines: (index % 3 == 0) ? 2 : 6,
        overflow: TextOverflow.ellipsis,
    );
  }
}
