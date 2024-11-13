import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  ThemeMode themeMode = ThemeMode.light;
  bool trigger = true;

  void changeThemeMode(){
    if(trigger){
      themeMode = ThemeMode.dark;
      trigger = false;
    } else {
      themeMode = ThemeMode.light;
      trigger = true;
    }

    update();
  }
}