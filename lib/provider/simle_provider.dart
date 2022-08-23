import 'package:flutter/material.dart';

import '../models/ui.dart';

class SimpleProvider with ChangeNotifier {
  int page = 1;
  // String title = Ui.name;
  int indexSelected = -1;
  Uz_ru uz_ru = Uz_ru.RU;

//=================================
  int get getpage => page;

  // String get gettitle => title;

  int get getindexSelected => indexSelected;

  Uz_ru get getuzru => uz_ru;

  //=================================

  void changepage(int newPage) {
    this.page = newPage;
    notifyListeners();
  }

  // void changetitle(String newtitle) {
  //   this.title = newtitle;
  //   notifyListeners();
  // }

  void changeindexSelected(int newindexSelected) {
    this.indexSelected = newindexSelected;
    notifyListeners();
  }

  void changuzru(Uz_ru newuz_ru) {
    this.uz_ru = newuz_ru;
  }
}
