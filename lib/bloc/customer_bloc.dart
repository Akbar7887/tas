import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tas/bloc/producer_state.dart';
import 'package:tas/models/Customer.dart';

import '../services/producer_repository.dart';

class CustomerBloc extends Cubit<ProducerState> {
  final Repository repository;

  // final Customer customer;

  CustomerBloc({required this.repository}) : super(ProducerEmtyState()) {

    void customerpost(Customer customer) => repository.postCustomer(customer);

    // on<ProducerLoadEvent>((event, emit) async {
    //   emit(ProducerLoadingState());
    //
    //   try {
    //     final Customer loadedcustomer = await repository.postCustomer(customer!);
    //     emit(CustomerLoadedState(loadedCustomer: loadedcustomer));
    //   } catch (_) {
    //     throw Exception(ProducerErorState());
    //   }
    // });
    //
    // on<ProducerClearEvent>((event, emit) {
    //   emit(ProducerEmtyState());
    // });
  }
}
