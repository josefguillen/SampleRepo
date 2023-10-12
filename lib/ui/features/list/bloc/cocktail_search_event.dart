import 'package:equatable/equatable.dart';
import 'package:test_project/domain/enum/action_enum.dart';
import 'package:test_project/domain/models/cocktail_model.dart';

abstract class CockTailSearchEvent extends Equatable {}

class SearchCockTail extends CockTailSearchEvent {
  final String name;

  SearchCockTail({required this.name});

  @override
  List<Object?> get props => [
        name,
      ];
}

class SetAction extends CockTailSearchEvent {
  final ActionEnum action;
  final Object? otherParams;

  SetAction({
    required this.action,
    this.otherParams,
  });

  @override
  List<Object?> get props => [
        action,
        otherParams,
      ];
}

class SetDetailState extends CockTailSearchEvent {
  final bool isShow;
  final CockTailModel? data;

  SetDetailState({
    required this.isShow,
    required this.data,
  });

  @override
  List<Object?> get props => [
        isShow,
        data,
      ];
}
