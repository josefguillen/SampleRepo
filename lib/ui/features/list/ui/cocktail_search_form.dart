import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/models/cocktail_model.dart';
import 'package:test_project/ui/features/list/components/item_detail_form.dart';
import 'package:test_project/ui/features/list/components/loading_form.dart';
import 'package:test_project/ui/features/list/components/search_action.dart';
import 'package:test_project/ui/features/component/button_widget.dart';
import 'package:test_project/ui/features/component/edit_text_widget.dart';
import 'package:test_project/ui/features/component/text_widget.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_bloc.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_event.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_state.dart';
import 'package:test_project/ui/features/list/components/list_item_form.dart';

class CockTailSearchForm extends StatelessWidget {
  const CockTailSearchForm({Key? key}) : super(key: key);

  void onSearch(BuildContext context, String name) {
    context.read<CockTailSearchBloc>().add(
          SearchCockTail(
            name: name,
          ),
        );
  }

  void onViewDetails(
    BuildContext context,
    CockTailModel data,
  ) {
    context.read<CockTailSearchBloc>().add(
          SetDetailState(
            isShow: true,
            data: data,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final txtCockTailNameController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          //Actions
          const SearchAction(),
          //Main UI
          Column(
            children: [
              Row(
                children: [
                  const TextWidget(
                    str: "CockTail Name: ",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EditTextWidget(
                      width: 0,
                      height: 50,
                      controller: txtCockTailNameController,
                      hintText: "Enter CockTail Name . . .",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ButtonWidget(
                    width: 70,
                    height: 50,
                    buttonName: "SEARCH",
                    onPress: () {
                      onSearch(context, txtCockTailNameController.text);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<CockTailSearchBloc, CockTailSearchState>(
                  buildWhen: (prev, current) => prev.cockTailDataList != current.cockTailDataList,
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.cockTailDataList.length,
                      //physics: const NeverScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = state.cockTailDataList[index];
                        return ListItemForm(
                          data: data,
                          onViewDetails: (cockTailData) {
                            onViewDetails(context, cockTailData);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          //Detail
          const ItemDetailForm(),
          //Loading
          const LoadingForm(),
        ],
      ),
    );
  }
}
