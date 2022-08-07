import 'package:bloc_test/bloc_test.dart';
import 'package:find_anime/app/cubit/language_cubit.dart';
import 'package:find_anime/app/cubit/theme_cubit.dart';
import 'package:find_anime/app/view/app.dart';
import 'package:find_anime/generated/l10n.dart';
import 'package:find_anime/search/search.dart';
import 'package:find_anime/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

class MockTraceMoeRepository extends Mock implements TraceMoeRepository {}

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {
  @override
  ThemeMode get appTheme => ThemeMode.light;
}

class MockLanguageCubit extends MockCubit<LanguageState>
    implements LanguageCubit {
  @override
  Locale get getLocale => const Locale('en');
}

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {
  @override
  TextEditingController get textController => TextEditingController();
}

void main() {
  group('FindAnimeApp', () {
    late TraceMoeRepository traceMoeRepository;
    late SearchCubit searchCubit;
    late ThemeCubit themeCubit;
    late LanguageCubit languageCubit;

    setUpAll(() {
      registerFallbackValue(MockSearchCubit());
    });

    setUp(() {
      traceMoeRepository = TraceMoeRepository();
      searchCubit = MockSearchCubit();
      themeCubit = MockThemeCubit();
      languageCubit = MockLanguageCubit();
    });

    testWidgets('Theme - system matching', (tester) async {
      await tester.pumpWidget(const FindAnimeApp());

      // capture BuildContext for theme testing
      final BuildContext context = tester.element(find.byType(FindAnimeApp));
      expect(context, isNotNull);

      final Brightness systemBrightness =
          SchedulerBinding.instance.window.platformBrightness;

      expect(Theme.of(context).brightness, systemBrightness);
    });

    testWidgets('SearchView rendering from app starting', (tester) async {
      await tester.pumpWidget(const FindAnimeApp());
      await tester.pump();

      expect(find.byType(SearchView), findsOneWidget);
    });

    testWidgets(
      'renders InitialSearchView for SearchState.initial',
      (tester) async {
        when(() => searchCubit.state).thenReturn(const SearchState());

        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [AppLocalizationDelegate()],
            home: BlocProvider(
              create: (_) => searchCubit,
              child: const SearchView(),
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(InitialSearchView), findsOneWidget);
      },
    );

    testWidgets(
      'renders BuildLoadingIndicator for SearchState.loading',
      (tester) async {
        when(() => searchCubit.state)
            .thenReturn(const SearchState(status: SearchStatus.loading));

        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [AppLocalizationDelegate()],
            home: BlocProvider(
              create: (_) => searchCubit,
              child: const SearchView(),
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(BuildLoadingIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'renders BuildError for SearchState.failure',
      (tester) async {
        when(() => searchCubit.state).thenReturn(SearchState(
          status: SearchStatus.failure,
          errorText: S().errorUnknown,
        ));

        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [AppLocalizationDelegate()],
            home: BlocProvider(
              create: (_) => searchCubit,
              child: const SearchView(),
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(BuildError), findsOneWidget);
      },
    );

    testWidgets(
      'renders ResultList for SearchState.success',
      (tester) async {
        when(() => searchCubit.state).thenReturn(
          const SearchState(status: SearchStatus.success, result: []),
        );

        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [AppLocalizationDelegate()],
            home: BlocProvider(
              create: (_) => searchCubit,
              child: const SearchView(),
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(ResultList), findsOneWidget);
      },
    );

    testWidgets(
      'Change app theme on button tap',
      (tester) async {
        when(() => searchCubit.state).thenReturn(const SearchState());

        await tester.pumpWidget(FindAnimeApp(
          themeCubit: themeCubit,
        ));

        await tester.pump();

        expect(find.byType(InitialSearchView), findsOneWidget);

        await tester.tap(find.byIcon(Icons.brightness_6_outlined));
        await tester.pumpAndSettle();

        verify(() => themeCubit.changeAppTheme()).called(1);
      },
    );

    testWidgets(
      'Change app language on button tap',
      (tester) async {
        when(() => searchCubit.state).thenReturn(const SearchState());

        await tester.pumpWidget(FindAnimeApp(
          languageCubit: languageCubit,
        ));

        await tester.pump();

        expect(find.byType(InitialSearchView), findsOneWidget);

        await tester.tap(find.byIcon(Icons.language_outlined));
        await tester.pumpAndSettle();

        verify(() => languageCubit.toggleAppLanguage()).called(1);
      },
    );
  });
}
