// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/model/note_model.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class CrudNoteController extends GetxController {
  final initStorage = GetStorage();
  final allBook = [].obs;
  final valueOfSearchTextField = "".obs;

  final typeOfNote = "".obs;
  final subjectTextEditingController = TextEditingController();
  final bodyTextEditingController = TextEditingController();
  final searchTextEditingController = TextEditingController();

  bool addBook() {
    try {
      var temp = NoteModel(
          getId(),
          typeOfNote.value,
          subjectTextEditingController.text,
          bodyTextEditingController.text,
          DateTime.now());

      allBook.value.add(temp.toJson());

      initStorage.write('listOfNote', allBook.value);

      // Clear textfield
      clear();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteBook(BuildContext context, NoteModel data) async {
    if (await confirm(context,
        title: const Text("Confirm"),
        content: const Text("Would you like to remove?"),
        textOK: const Text("Yes"),
        textCancel: const Text("Cancel"))) {
      try {
        // parse to jsos
        final datas = data.toJson();
        setList();
        // check item in list
        allBook.value.removeWhere((note) => note['id'] == datas['id']);
        refreshStorage();
        clear();
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  bool updateNote(Map<String, dynamic> startModel) {
    final index = allBook.value
        .indexWhere((element) => element['id'] == startModel['id']);

    try {
      var newValue = NoteModel(
          getId(),
          typeOfNote.value,
          subjectTextEditingController.text,
          bodyTextEditingController.text,
          DateTime.now());

      allBook.value[index] = newValue.toJson();
      refreshStorage();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  getItemWithCategory(int optionSelected) {
    switch (optionSelected) {
      case 1:
        return allBook.where((value) => value['kategori'] == "Journal");
      case 2:
        return allBook.value
            .where((value) => value['kategori'] == "Quick Note");
      case 3:
        return allBook.value
            .where((value) => value['kategori'] == "To-do List");
      default:
        return NoteModel.second();
    }
  }

  Iterable<dynamic> searchItem() {
    return allBook.value.where((value) {
      final NoteModel model = NoteModel.second().fromJson(value);
      return model.judul!
              .toLowerCase()
              .contains(searchTextEditingController.text) ||
          model.deskripsi!
              .toLowerCase()
              .contains(searchTextEditingController.text);
    });
  }

  show() {
    print(initStorage.read('listOfNote'));
  }

  void refreshStorage() {
    initStorage.remove('listOfNote');
    initStorage.write('listOfNote', allBook.value);
    allBook(initStorage.read('listOfNote'));
  }

  setOfNote(value) {
    typeOfNote(value);
  }

  setList() {
    allBook(initStorage.read('listOfNote'));
  }

  int getId() {
    setList();
    return allBook.length;
  }

  clear() {
    typeOfNote("Select type of note");
    subjectTextEditingController.clear();
    bodyTextEditingController.clear();
  }

  addValuetoControllerTextField({subject, body, type}) {
    typeOfNote(type);
    subjectTextEditingController.text = subject;
    bodyTextEditingController.text = body;
  }
}
