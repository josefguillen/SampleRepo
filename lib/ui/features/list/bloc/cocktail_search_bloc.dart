import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_project/data/repositories/cock_tail_repository.dart';
import 'package:test_project/domain/enum/action_enum.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_event.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_state.dart';

class CockTailSearchBloc extends Bloc<CockTailSearchEvent, CockTailSearchState> {
  final CockTailRepository cockTailRepository;

  CockTailSearchBloc({
    required this.cockTailRepository,
  }) : super(const CockTailSearchState()) {
    on<SearchCockTail>(onSearchCockTail);
    on<SetAction>(onSetAction);
    on<SetDetailState>(onSetDetailState);
  }

  FutureOr<void> onSearchCockTail(
    SearchCockTail event,
    Emitter<CockTailSearchState> emit,
  ) async {
    //Show loading
    emit(state.copyWith(isLoading: true));

    final cockTailName = event.name;

    if (cockTailName.isEmpty) {
      emit(
        state.copyWith(
          action: ActionEnum.showEmptyFieldMessage,
        ),
      );
    } else {
      final data = await cockTailRepository.getCockTailListByName(cockTailName);
      data.fold(
        (l) {
          emit(
            state.copyWith(
              isLoading: false,
              action: ActionEnum.showMessageFailedToGetData,
              otherParams: l.errorMessage,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              cockTailDataList: r,
              isLoading: false,
            ),
          );
        },
      );
    }
  }

  FutureOr<void> onSetAction(
    SetAction event,
    Emitter<CockTailSearchState> emit,
  ) {
    emit(
      state.copyWith(
        action: event.action,
        otherParams: event.otherParams,
      ),
    );
  }

  FutureOr<void> onSetDetailState(
    SetDetailState event,
    Emitter<CockTailSearchState> emit,
  ) {
    emit(
      state.copyWith(
        showDetail: event.isShow,
        otherParams: event.data,
      ),
    );
  }
}
