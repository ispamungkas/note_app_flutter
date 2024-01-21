import 'package:get/get.dart';

class ColorController extends GetxController{
  var choose = "default".obs;
  
  change(var i) => choose(i);
}