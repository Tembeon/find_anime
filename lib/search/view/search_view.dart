import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search.dart';
import '../widgets/result_list_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              switch (state.status) {
                case SearchStatus.initial:
                  return const BuildSearchView();
                case SearchStatus.success:
                  return BuildResultList(result: state.result);
                case SearchStatus.failure:
                  return BuildError(
                    errorText: state.errorText ??
                        'Something went wrong, please try again',
                  );
                case SearchStatus.loading:
                  return const BuildLoadingIndicator();
              }
            },
          ),
        ),
        floatingActionButton:
            context.select((SearchCubit cubit) => cubit.state.status) ==
                    SearchStatus.success
                ? FloatingActionButton.extended(
                    onPressed: () => context.read<SearchCubit>().resetState(),
                    label: const Text('New search'),
                    icon: const Icon(Icons.search_outlined),
                  )
                : null,
      ),
    );
  }
}

class BuildSearchView extends StatelessWidget {
  const BuildSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Find anime:',
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: TextFormField(
              controller: context.read<SearchCubit>().controller,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.headline4,
              decoration: const InputDecoration(labelText: 'Enter image url'),
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () => context.read<SearchCubit>().searchByUrl(),
          child: const Text('Search'),
        ),
      ],
    );
  }
}

/// Loading indicator
class BuildLoadingIndicator extends StatelessWidget {
  const BuildLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

/// Show error text
class BuildError extends StatelessWidget {
  const BuildError({Key? key, required this.errorText}) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorText,
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: OutlinedButton(
            onPressed: () => context.read<SearchCubit>().resetState(),
            child: const Text('New search'),
          ),
        ),
      ],
    );
  }
}

/// ListView with parsed result
class BuildResultList extends StatelessWidget {
  const BuildResultList({Key? key, required this.result}) : super(key: key);
  final List<dynamic> result;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth > 1080 ? deviceWidth / 3 : deviceWidth,
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ResultListItem(
            result: result[index],
          );
        },
      ),
    );
  }
}
