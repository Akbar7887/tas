import 'package:flutter/material.dart';

import '../models/ModelSet.dart';

class ModelsProvider with ChangeNotifier {
  ModelSet? modelSet = null;
  List<ModelSet> listModel = [];

  ModelSet get getmodel => modelSet!;

  List<ModelSet> get getlist => listModel;

  void changemodel(ModelSet newmodelSet) {
    this.modelSet = newmodelSet;
    // notifyListeners();
  }

  void changeListmodel(List<ModelSet> list) {
    this.listModel = list;
    // notifyListeners();
  }
}
