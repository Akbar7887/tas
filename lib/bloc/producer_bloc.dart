import 'package:TAS/bloc/producer_event.dart';
import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Producer.dart';
import '../services/producer_repository.dart';

class ProducerBloc extends Bloc<ProducerEvent, ProducerState> {
  final Repository producerRepository;

  ProducerBloc({required this.producerRepository}) : super(ProducerEmtyState()) {
    on<ProducerLoadEvent>((event, emit) async {
      emit(ProducerLoadingState());

      try {
        final List<Producer> loadedProducerslist =
            await producerRepository.getAllProducers();

        emit(ProducerLoadedState(loadedProduser: loadedProducerslist));
      } catch (_) {
        emit(ProducerErorState());
      }
    });

    on<ProducerClearEvent>((event, emit) async {
      emit(ProducerEmtyState());
    });
  }

  Future<List<Producer>> getAll() async {
    return await producerRepository.getAllProducers();
  }
}
