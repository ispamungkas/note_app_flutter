import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{
  
  final titleText = ''.obs;

  final subjectInputController = TextEditingController();

  changeTitleText(title) {
    titleText(title);
  }
}