import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/model/note_model.dart';

class CrudNoteController extends GetxController {

  final initStorage = GetStorage();

  final allBook = <Map<String,dynamic>>[].obs;

  final typeOfNote = "".obs;
  final subjectTextEditingController = TextEditingController();
  final bodyTextEditingController = TextEditingController();

  bool addBook() {
    try {
      var temp = NoteModel(getId(), typeOfNote.value , subjectTextEditingController.text, bodyTextEditingController.text, DateTime.now());

      // ignore: invalid_use_of_protected_member
      allBook.value.add(temp.toJson());

      initStorage.write('listOfNote', allBook.value);
      List<Map<String,dynamic>> tempo = initStorage.read('listOfNote'); 
      print(tempo);
      return true;
    } catch (e){
      print(e);
      return false;
    }
  }

  show(){
    List<Map<String,dynamic>> attmp = initStorage.read('listOfNote');
    print(attmp);
  }

  setOfNote(value){
    typeOfNote(value);
  }
  
  setList(){
    allBook(initStorage.read('listOfNote'));
  }

  int getId(){
    setList();
    return allBook.length - 1;
  }
}