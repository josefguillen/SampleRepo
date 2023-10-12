import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project/domain/enum/action_enum.dart';
import 'package:test_project/domain/models/cocktail_model.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_bloc.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_event.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_state.dart';

class SearchAction extends StatelessWidget {
  const SearchAction({Key? key}) : super(key: key);

  void setAction(
    BuildContext context, {
    required ActionEnum action,
    Object? otherParams,
  }) {
    context.read<CockTailSearchBloc>().add(
          SetAction(
            action: action,
            otherParams: otherParams,
          ),
        );
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CockTailSearchBloc, CockTailSearchState>(
      buildWhen: (prev, current) => prev.action != current.action,
      builder: (context, state) {
        return const SizedBox();
      },
      listenWhen: (prev, current) => prev.action != current.action,
      listener: (context, state) {
        final action = state.action;
        switch (action) {
          case ActionEnum.initial:
            break;
          case ActionEnum.showEmptyFieldMessage:
            showToastMessage("Field is empty");
            break;
          case ActionEnum.showMessageFailedToGetData:
            final message = state.otherParams as String;
            showToastMessage(message);
            break;
        }
        setAction(context, action: ActionEnum.initial);
      },
    );
  }
}
