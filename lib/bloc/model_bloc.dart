import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tas/bloc/producer_event.dart';
import 'package:tas/bloc/producer_state.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/services/producer_repository.dart';

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
