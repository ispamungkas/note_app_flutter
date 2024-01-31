import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{
  
  final titleText = ''.obs;
  final optionState = 0.obs;

  final subjectInputController = TextEditingController();

  changeTitleText(title) {
    titleText(title);
  }

  changeOptionState(option){
    optionState(option);
  }

}