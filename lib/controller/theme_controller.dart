import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  // 테마모드
  ThemeMode themeMode = ThemeMode.light;

  bool trigger = true;

  // AppBar의 아이콘을 누를경우 작동하는 로직
  // Theme모드를 변경
  // Theme가 변경되면, UI업데이트가 필요하기 때문에 Update필요
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