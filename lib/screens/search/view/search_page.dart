import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search.dart';
import 'search_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: SearchView(),
    );
  }
}
