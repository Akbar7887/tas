import 'package:TAS/bloc/producer_event.dart';
import 'package:TAS/bloc/producer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/News_Company.dart';
import '../services/producer_repository.dart';

class NewsCompanyBloc extends Bloc<ProducerEvent,ProducerState>{

  final Repository repository;

  NewsCompanyBloc({required this.repository}) : super(ProducerEmtyState()) {
    on<ProducerLoadEvent>((event, emit) async {
      emit(ProducerLoadingState());

      try {
        final List<NewsCompany> loadednews = await repository.getNews();
        emit(NewsCompanyLoadedState(loadednews: loadednews));
      } catch (_) {
        throw Exception(ProducerErorState());
      }
    });

    on<ProducerClearEvent>((event, emit) {
      emit(ProducerEmtyState());
    });
  }

}