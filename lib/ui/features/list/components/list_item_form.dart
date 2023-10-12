import 'package:flutter/material.dart';
import 'package:test_project/domain/models/cocktail_model.dart';
import 'package:test_project/ui/features/component/button_widget.dart';
import 'package:test_project/ui/features/component/text_widget.dart';
import 'package:test_project/ui/features/list/components/image_widget.dart';

class ListItemForm extends StatelessWidget {
  final CockTailModel data;
  final Function(CockTailModel) onViewDetails;

  const ListItemForm({
    required this.data,
    required this.onViewDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWidget(
          url: data.imageUrl,
          width: 50,
          height: 50,
        ),
        TextWidget(str: data.name),
        const Expanded(
          child: SizedBox(),
        ),
        ButtonWidget(
          width: 100,
          height: 50,
          buttonName: "VIEW DETAILS",
          onPress: () {
            onViewDetails(data);
          },
        ),
      ],
    );
  }
}
