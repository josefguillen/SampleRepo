import 'package:equatable/equatable.dart';
import 'package:test_project/domain/enum/action_enum.dart';
import 'package:test_project/domain/models/cocktail_model.dart';

class CockTailSearchState extends Equatable {
  final ActionEnum action;
  final List<CockTailModel> cockTailDataList;
  final bool tmpReloadList;
  final bool isLoading;
  final Object? otherParams;
  final bool showDetail;

  const CockTailSearchState({
    this.action = ActionEnum.initial,
    this.cockTailDataList = const [],
    this.tmpReloadList = false,
    this.isLoading = false,
    this.otherParams,
    this.showDetail = false,
  });

  CockTailSearchState copyWith({
    ActionEnum? action,
    List<CockTailModel>? cockTailDataList,
    bool? tmpReloadList,
    bool? isLoading,
    Object? otherParams,
    bool? showDetail,
  }) {
    return CockTailSearchState(
      action: action ?? this.action,
      cockTailDataList: cockTailDataList ?? this.cockTailDataList,
      tmpReloadList: tmpReloadList ?? this.tmpReloadList,
      isLoading: isLoading ?? this.isLoading,
      otherParams: otherParams ?? this.otherParams,
      showDetail: showDetail ?? this.showDetail,
    );
  }

  @override
  List<Object?> get props => [
        action,
        cockTailDataList,
        tmpReloadList,
        isLoading,
        otherParams,
        showDetail,
      ];
}
