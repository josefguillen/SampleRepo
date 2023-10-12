import 'package:equatable/equatable.dart';

class CockTailModel extends Equatable {
  final int id;
  final String name;
  final String tag;
  final String category;
  final String imageUrl;

  const CockTailModel({
    this.id = 0,
    this.name = "",
    this.tag = "",
    this.category = "",
    this.imageUrl = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        tag,
        category,
        imageUrl,
      ];
}
