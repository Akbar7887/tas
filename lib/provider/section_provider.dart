import 'package:flutter/material.dart';

import '../models/Section.dart';


class SectionProvider extends ChangeNotifier{

  Section? section = null;

  Section? get getSection {
    if(section == null){
      return null;
    }else{
      return this.section;
    }
  }


  void changeSection(Section? newSection){

    this.section = newSection;
    notifyListeners();
  }

}