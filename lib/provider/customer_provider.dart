import 'package:flutter/widgets.dart';

import '../models/Customer.dart';

class CustromerProvider with ChangeNotifier{

  Customer? customer;
  // Uz_ru uz_ru = Uz_ru.UZ;

  Customer get getcustomer => customer!;
  // Uz_ru get getuzru => uz_ru;

  void changCustomer(Customer newcustomer){

    this.customer = customer;
    notifyListeners();
  }
  // void changuzru(Uz_ru newuz_ru){
  //   this.uz_ru = newuz_ru;
  // }
}