import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ItemNoteWidget extends StatelessWidget {
  ItemNoteWidget({super.key, this.index});
  final index;
  bool? toggle = true;

  @override
  Widget build(BuildContext context) {
    Random rand = Random();

    return StaggeredGridTile.count(
      mainAxisCellCount: randomMaxHeight(rand.nextInt(4)),
      crossAxisCellCount: 2,
      child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(CustomColor.background)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [date(context), judul(context), body(context, index)],
              ),
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

  Widget body(BuildContext context, int index) {;
    return Text(
      "ini adalah bodsdfsdfsdd" * 10,
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
