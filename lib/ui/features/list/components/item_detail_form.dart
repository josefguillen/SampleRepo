import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/models/cocktail_model.dart';
import 'package:test_project/ui/features/component/button_widget.dart';
import 'package:test_project/ui/features/component/text_widget.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_bloc.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_event.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_state.dart';
import 'package:test_project/ui/features/list/components/image_widget.dart';

class ItemDetailForm extends StatelessWidget {

  const ItemDetailForm({
    Key? key,
  }) : super(key: key);

  Widget rowData(String label, String val) {
    return Row(
      children: [
        TextWidget(
          str: label,
        ),
        const SizedBox(
          width: 10,
        ),
        TextWidget(
          str: val,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final containerWidth = width * 0.8;
    final containerHeight = height * 0.7;
    return BlocBuilder<CockTailSearchBloc, CockTailSearchState>(
      buildWhen: (prev, current) => prev.showDetail != current.showDetail,
      builder: (context, state) {
        if (!state.showDetail) {
          return const SizedBox();
        }
        final data = state.otherParams as CockTailModel;
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(10),
          color: Colors.black12,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: containerWidth,
              height: containerHeight,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageWidget(
                    url: data.imageUrl,
                    width: 100,
                    height: 100,
                  ),
                  rowData("NAME: ", data.name),
                  rowData("CATEGORY: ", data.category),
                  rowData("TAGS: ", data.tag),
                  ButtonWidget(
                    width: 100,
                    height: 50,
                    buttonName: "CLOSE",
                    onPress: () {
                      context.read<CockTailSearchBloc>().add(
                            SetDetailState(
                              isShow: false,
                              data: null,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
