import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '/app/cubit/language_cubit.dart';
import '/app/cubit/theme_cubit.dart';
import '../../../core/generated/localization/l10n.dart';
import '../bloc/dropzone_cubit.dart';
import '../search.dart';
import '../widgets/result_list_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () => InitialSearchView(),
          loading: () => const BuildLoadingIndicator(),
          failure: (message) => BuildError(errorText: message),
          showingResult: (result) => ResultList(result: result),
          userInputFailure: (_) => InitialSearchView(),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          userInputFailure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}

/// View with search view, initial view
class InitialSearchView extends StatefulWidget {
  const InitialSearchView({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialSearchView> createState() => _InitialSearchViewState();
}

class _InitialSearchViewState extends State<InitialSearchView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isMobile = mediaQuery.size.width < 600;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Change app language',
            onPressed: () => context.read<LanguageCubit>().toggleAppLanguage(),
            icon: const Icon(Icons.language_outlined),
          ),
          const SizedBox(
            width: 24.0,
          ),
          IconButton(
            tooltip: 'Change app theme',
            onPressed: () => context.read<ThemeCubit>().changeAppTheme(),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: isMobile ? 12.0 : mediaQuery.size.longestSide / 10,
        ),
        child: Focus(
          autofocus: true,
          canRequestFocus: true,
          onKey: (_, event) {
            if (event.isControlPressed &&
                event.physicalKey == PhysicalKeyboardKey.keyV &&
                !event.repeat) {
              context.read<SearchBloc>().add(
                    SearchEvent.pastedContent(
                      Pasteboard.image,
                      Pasteboard.text,
                    ),
                  );
            }

            return KeyEventResult.ignored;
          },
          child: Stack(
            children: [
              if (kIsWeb)
                DropzoneView(
                  operation: DragOperation.move,
                  onCreated: context.read<DropZoneCubit>().setController,
                  onDrop: (file) => context
                      .read<SearchBloc>()
                      .add(SearchEvent.searchViaFile(file)),
                  onError: print,
                ),
              Column(
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    S.of(context).newSearchHint,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 18.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _textEditingController,
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.headline4,
                        decoration: InputDecoration(
                          labelText: S.of(context).enterImageUrl,
                          helperText: S.of(context).enterImageUrlHint,
                        ),
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      if (kIsWeb)
                        SizedBox(
                          height: 42.0,
                          width: mediaQuery.size.width / 4,
                          child: OutlinedButton(
                            onPressed: () async {
                              // awaiting to pick up file
                              final htmlFile = (await context
                                      .read<DropZoneCubit>()
                                      .state
                                      .getControllerOrNull!
                                      .pickFiles())
                                  .first;
                              if (!mounted) return; // widget is not at tree
                              context.read<SearchBloc>().add(
                                    SearchEvent.searchViaFile((await context
                                        .read<DropZoneCubit>()
                                        .state
                                        .convertFile(htmlFile))!),
                                  );
                            },
                            child: Text(S.of(context).selectFileButtonText),
                          ),
                        ),
                      SizedBox(
                        height: 42.0,
                        width: mediaQuery.size.width / 4,
                        child: ElevatedButton(
                          onPressed: () => context.read<SearchBloc>().add(
                                SearchEvent.searchViaDirectUrl(
                                  _textEditingController.value.text,
                                ),
                              ),
                          child: Text(S.of(context).searchButtonText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 42.0,
                child: ElevatedButton(
                  onPressed: () => context
                      .read<SearchBloc>()
                      .add(const SearchEvent.openSearch()),
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
  final List<Result> result;

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
            onPressed: () =>
                context.read<SearchBloc>().add(const SearchEvent.openSearch()),
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
