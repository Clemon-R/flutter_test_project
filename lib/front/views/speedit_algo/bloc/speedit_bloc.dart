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
      var regExp = RegExp(
        r"[0-9]",
      );
      if (event.articles.isNotEmpty && !regExp.hasMatch(event.articles)) {
        emit(SpeeditResultState(
          articles: _articles,
          result: "Input error",
        ));
        return;
      }

      _articles = event.articles;
      emit(SpeeditResultState(
        articles: _articles,
        result: _speeditService.splitArticlesByCards(_articles),
      ));
    });
  }
}
