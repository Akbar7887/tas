import 'package:TAS/bloc/producer_event.dart';
import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Section.dart';
import '../services/producer_repository.dart';

class SectionBloc extends Bloc<ProducerEvent, ProducerState> {
  final Repository repository;

  SectionBloc({required this.repository}) : super(ProducerEmtyState()) {
    on<ProducerLoadEvent>((event, emit) async {
      emit(ProducerLoadingState());

      try {
        final List<Section> loadedSection = await repository.getSections();
        emit(SectionLoadedState(loadedSection: loadedSection));
      } catch (_) {
        throw Exception(ProducerErorState());
      }
    });

    on<ProducerClearEvent>((event, emit) {
      emit(ProducerEmtyState());
    });
  }
}
