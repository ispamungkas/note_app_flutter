import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/controller/color_controller.dart';
import 'package:note_app/pages/widget/item_recent_widget.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';
import 'package:note_app/widget/item_note_recent.dart';
import 'package:note_app/widget/item_note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int choose = 1;

  changeChoose(int value) {
    setState(() {
      choose = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> nams = ['ucup', 'hasim', 'asyari', 'coaks'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(CustomColor.background),
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All notes",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                searchBox()
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Recently added",
                    style: CustomStyle.titleLarge(context),
                  ),
                  GestureDetector(
                    child: Text(
                      "See all",
                      style: CustomStyle.titleMediumLight(context),
                    ),
                  ),
                ],
              ),
            ),
            ItemRecentWidget(datas: nams),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Categories",
                    style: CustomStyle.titleLarge(context),
                  ),
                  GestureDetector(
                    child: Text(
                      "Browse",
                      style: CustomStyle.titleMediumLight(context),
                    ),
                  ),
                ],
              ),
            ),
            option(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: MasonryGridView.count(
                padding: EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemBuilder: (context, index) => ItemNoteWidget(index: index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(CustomColor.primary)),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
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
    );
  }

  Widget option() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(CustomColor.background),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  changeChoose(1);
                  print(1);
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInSine,
                  decoration: BoxDecoration(
                      color: Color((choose == 1)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Quick Notes",
                      style: CustomStyle.titleMediumLightWhiteFunc(
                          context, (choose == 1) ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  changeChoose(2);
                  print(2);
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInSine,
                  decoration: BoxDecoration(
                      color: Color((choose == 2)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "To-do List",
                      style: CustomStyle.titleMediumLightWhiteFunc(
                          context, (choose == 2) ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  changeChoose(3);
                  print(3);
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInSine,
                  decoration: BoxDecoration(
                      color: Color((choose == 3)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Journal",
                      style: CustomStyle.titleMediumLightWhiteFunc(
                          context, (choose == 3) ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}