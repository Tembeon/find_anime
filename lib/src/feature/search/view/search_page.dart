import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

import '../bloc/dropzone_cubit.dart';
import '../search.dart';
import 'search_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, this.traceMoeRepository}) : super(key: key);
  final TraceMoeRepository? traceMoeRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(traceMoeRepository ?? TraceMoeRepository()),
        ),
        BlocProvider<DropZoneCubit>(create: (_) => DropZoneCubit()),
      ],
      child: const SearchView(),
    );
  }
}
