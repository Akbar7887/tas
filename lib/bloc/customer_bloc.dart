import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Customer.dart';
import '../services/producer_repository.dart';

class CustomerBloc extends Cubit<ProducerState> {
  final Repository repository;

  // final Customer customer;

  CustomerBloc({required this.repository}) : super(ProducerEmtyState()) {

    void customerpost(Customer customer, String model_id) => repository.postCustomer(customer, model_id);

  }

  Future<Customer> post(Customer customer, String model_id) async {
    return await repository.postCustomer(customer, model_id);
  }
}
