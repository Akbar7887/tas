import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/ui.dart';


class EnumuzruBloc extends Cubit<ProducerState>{

  late final Uz_ru uz_ru;
  EnumuzruBloc({required this.uz_ru}):super(ProducerEmtyState());

  Uz_ru  getEnumuzrubloc(){
    return this.uz_ru;
  }

  void changeEnumuzrubloc(Uz_ru uz_ru){
    this.uz_ru = uz_ru;
  }


}