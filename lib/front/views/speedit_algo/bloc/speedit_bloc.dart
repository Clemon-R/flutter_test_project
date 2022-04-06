import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/dependencies_provider.dart';
import 'package:test_project/job/services/ispeedit_service.dart';

import 'speedit_event.dart';
import 'speedit_state.dart';

class SpeeditBloc extends Bloc<SpeeditEvent, SpeeditState> {
  final ISpeeditService _speeditService = DependenciesProvider.get();

  String _articles = "";

  SpeeditBloc() : super(SpeeditClearState()) {
    on<SpeeditNewEntryEvent>((event, emit) {
      _articles = event.articles;
      emit(SpeeditResultState(
        articles: _articles,
        result: _speeditService.splitArticlesByCards(_articles),
      ));
    });
  }
}
