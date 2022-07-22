import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../../generated/l10n.dart';
import '../models/search_result_model.dart';
import '../search.dart';
import '../widgets/result_list_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.status) {
          case SearchStatus.initial:
            return const BuildSearchView();
          case SearchStatus.success:
            return ResultList(result: state.result);
          case SearchStatus.failure:
            return BuildError(
              errorText: state.errorText ?? S.of(context).errorUnknown,
            );
          case SearchStatus.loading:
            return const BuildLoadingIndicator();
        }
      },
    );
  }
}

/// View with search view, initial view
class BuildSearchView extends StatelessWidget {
  const BuildSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isMobile = mediaQuery.size.width < 600;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: isMobile ? 12.0 : mediaQuery.size.longestSide / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).newSearch,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: context.read<SearchCubit>().controller,
                  textInputAction: TextInputAction.next,
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                    labelText: S.of(context).enterImageUrl,
                    helperText: S.of(context).enterImageUrlHint,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 42.0,
              width: mediaQuery.size.width / 4,
              child: ElevatedButton(
                onPressed: () => context.read<SearchCubit>().searchByUrl(),
                child: Text(S.of(context).searchButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading indicator
class BuildLoadingIndicator extends StatelessWidget {
  const BuildLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

/// Show error text
class BuildError extends StatelessWidget {
  const BuildError({Key? key, required this.errorText}) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 42.0,
                child: ElevatedButton(
                  onPressed: () => context.read<SearchCubit>().resetState(),
                  child: Text(S.of(context).openSearchButton),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultList extends StatelessWidget {
  const ResultList({Key? key, required this.result}) : super(key: key);
  final List<ResultModel> result;

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(
      builder: (context, breakpoint) {
        final LayoutClass device = breakpoint.device;
        final int columns = device == LayoutClass.desktop ? 2 : 1;

        return Scaffold(
          body: WaterfallFlow.builder(
            itemCount: result.length,
            padding: EdgeInsets.only(
              top: device != LayoutClass.desktop
                  ? MediaQuery.of(context).padding.top
                  : 0.0,
              left: getPaddings(breakpoint.window),
              right: getPaddings(breakpoint.window),
            ),
            //cacheExtent: 0.0,
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              lastChildLayoutTypeBuilder: (index) => index == result.length
                  ? LastChildLayoutType.foot
                  : LastChildLayoutType.none,
            ),
            itemBuilder: (context, index) => ResultListItem(
              result: result[index],
              device: breakpoint.device,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.read<SearchCubit>().resetState(),
            label: Text(S.of(context).openSearchButton),
            icon: const Icon(Icons.search_outlined),
          ),
        );
      },
    );
  }

  double getPaddings(WindowSize size) {
    switch (size) {
      case WindowSize.xsmall:
        return 12.0;
      case WindowSize.small:
        return 18.0;
      case WindowSize.medium:
        return 24.0;
      case WindowSize.large:
        return 240.0;
      case WindowSize.xlarge:
        return 546.0;
    }
  }
}
