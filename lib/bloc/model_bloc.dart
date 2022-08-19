import 'package:TAS/bloc/producer_event.dart';
import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/ModelSet.dart';
import '../services/producer_repository.dart';

class ModelBloc extends Bloc<ProducerEvent, ProducerState> {
  final Repository repository;

  ModelBloc({required this.repository}) : super(ProducerEmtyState()) {
    on<ProducerLoadEvent>((event, emit) async {
      emit(ProducerLoadingState());

      try {
        final List<ModelSet> loadedmodels = await repository.getAllModels();
        emit(ModelLoadedState(loadedModel: loadedmodels));
      } catch (_) {
        throw Exception(ProducerErorState());
      }
    });

    on<ProducerClearEvent>((event, emit) {
      emit(ProducerEmtyState());
    });
  }
}
