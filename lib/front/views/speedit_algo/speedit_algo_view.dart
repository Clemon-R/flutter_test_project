import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_project/front/constants/text_styles.dart';

import 'bloc/speedit_bloc.dart';
import 'bloc/speedit_event.dart';
import 'bloc/speedit_state.dart';

class SpeeditAlgoView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController(text: "");
  late final SpeeditBloc _bloc;

  SpeeditAlgoView({Key? key}) : super(key: key) {
    _controller.addListener(() {
      _bloc.add(SpeeditNewEntryEvent(articles: _controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeeditBloc>(
      lazy: false,
      create: (BuildContext context) {
        _bloc = SpeeditBloc();
        return _bloc;
      },
      child: BlocBuilder<SpeeditBloc, SpeeditState>(builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Articles',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Résultat",
                      style: TextStyles.sectionTitle,
                    ),
                    Text(
                      "Chaîne d'articles en entrée : " + _controller.text,
                      textAlign: TextAlign.left,
                    ),
                    _buildResult(state),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildResult(SpeeditState state) {
    if (state is SpeeditResultState) {
      return Text(
        "Chaîne d'articles amballés : " + state.result,
        textAlign: TextAlign.left,
      );
    } else {
      return const Text(
        "Chaîne d'articles amballés : ",
        textAlign: TextAlign.left,
      );
    }
  }
}
