import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/repositories/cock_tail_repository.dart';
import 'package:test_project/ui/features/list/bloc/cocktail_search_bloc.dart';
import 'package:test_project/ui/features/list/ui/cocktail_search_form.dart';

class CockTailSearchScreen extends StatelessWidget {
  const CockTailSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => CockTailSearchBloc(
            cockTailRepository: CockTailRepository(),
          ),
        ),
      ],
      child: const CockTailSearchForm(),
    );
  }
}
