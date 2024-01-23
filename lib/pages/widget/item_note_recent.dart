import 'package:flutter/material.dart';
import 'package:note_app/pages/detail_page.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class ItemNoteRecent extends StatelessWidget {
  const ItemNoteRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const DetailPage())),
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
                    'tanggal',
                    style: CustomStyle.bodySmall(context),
                  ),
                  Text(
                    "Shopping List",
                    style: CustomStyle.titleMediumBold(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ini adalah deskripsi dari orang yang keren skelai sdfsafadk ssafndskfndsakfnsjankjsanfkjnfkj",
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
