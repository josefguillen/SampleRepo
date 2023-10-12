import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_bloc.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_state.dart';

class LoadingForm extends StatelessWidget {
  const LoadingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CockTailSearchBloc, CockTailSearchState>(
      builder: (context, state) {
        if (!state.isLoading) {
          return const SizedBox();
        }
        return Container(
          width: width,
          height: height,
          color: Colors.black12,
          child: const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
