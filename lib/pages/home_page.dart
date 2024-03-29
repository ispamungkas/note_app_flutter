import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/pages/about_page.dart';
import 'package:note_app/pages/add_note_page.dart';
import 'package:note_app/pages/detail_page.dart';
import 'package:note_app/pages/list_of_note.dart';
import 'package:note_app/pages/search_page.dart';
import 'package:note_app/pages/widget/item_recent_widget.dart';
import 'package:note_app/utils/custom_color.dart';
import 'package:note_app/utils/custom_fontstyle.dart';
import 'package:note_app/pages/widget/item_note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _MenuPopUp { about, exit }

class _HomePageState extends State<HomePage> {
  int choose = 1;

  changeChoose(int value) {
    setState(() {
      choose = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final crudController = CrudNoteController();
    crudController.setList();

    // data filtered by category
    Iterable<dynamic> datasCategory =
        crudController.getItemWithCategory(choose);

    void nav(NoteModel value) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    dataModel: value,
                  )));
      setState(() {});
    }

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
                    PopupMenuButton<_MenuPopUp>(
                      itemBuilder: (context) => [
                        menuPopUp(context, _MenuPopUp.about, "About"),
                        menuPopUp(context, _MenuPopUp.exit, "Exit")
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case _MenuPopUp.about:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (e) => const AboutPage()));
                            break;
                          case _MenuPopUp.exit:
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                            break;
                          default:
                            print("Not Selected");
                        }
                      },
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Recently added",
                      style: CustomStyle.titleLarge(context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListOfNotePage())),
                      child: Text(
                        "See all",
                        style: CustomStyle.titleMediumLight(context),
                      ),
                    ),
                  ],
                ),
              ),
              // ignore: invalid_use_of_protected_member
              ItemRecentWidget(
                // ignore: invalid_use_of_protected_member
                datas: crudController.allBook.value,
                handleNavigate: (v) {
                  nav(v);
                },
              ),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                child: (datasCategory.isNotEmpty) ? StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: datasCategory
                      .mapIndexed((e, i) => ItemNoteWidget(
                            index: i,
                            noteModel: NoteModel.second().fromJson(e),
                            callback: (value) => nav(value),
                          ))
                      .toList(),
                ) : SizedBox(height: 225,child: Center(child: Text("Empty Note", style: CustomStyle.titleMedium(context),),)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (e) => const AddNotePage(
                        title: "Add Notes",
                      )));
        },
        child: Container(
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
      ),
    );
  }

  menuPopUp(BuildContext context, _MenuPopUp value, String title) {
    return PopupMenuItem(
      value: value,
      child: Text(
        title,
        style: CustomStyle.bodySmall(context),
      ),
    );
  }

  Widget searchBox() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SearchPage())),
      child: Hero(
        tag: "c",
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Search",
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        color: Colors.grey,
                        letterSpacing: -1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget option() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                      color: Color((choose == 1)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Journal",
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
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInSine,
                  decoration: BoxDecoration(
                      color: Color((choose == 2)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Quick Notes",
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
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInSine,
                  decoration: BoxDecoration(
                      color: Color((choose == 3)
                          ? CustomColor.primary
                          : CustomColor.background),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "To-do List",
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

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
