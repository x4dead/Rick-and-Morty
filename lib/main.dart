import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/utils/router/router.dart';

void main() async {
  //await AppInit.init();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final settings = ref.watch(River.settingsProvider);
    final router = AppRouter.router;
    return MaterialApp.router(
      // theme: ThemeData(useMaterial3: true),
      // scrollBehavior: CustomScrollBehavior(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) => child!,
      title: 'Rick And Morty',
      //supportedLocales: L10n.all,
      // locale: Locale(settings.locale!),
//   localizationsDelegates: const [
//     AppLocalizations.delegate,
//     GlobalMaterialLocalizations.delegate,
//     GlobalCupertinoLocalizations.delegate,
//     GlobalWidgetsLocalizations.delegate,
//   ],
//      builder: (context, child) => ResponsiveBreakpoints.builder(
//        child: child!,
//        breakpoints: [
//          const Breakpoint(start: 0, end: 430, name: 'mobile'),
//          const Breakpoint(
//              start: 431, end: 823, name: '1_column_min_431_max_823'),
//          const Breakpoint(
//              start: 824, end: 1103, name: '2_columns_min_824_max_1103'),
//          const Breakpoint(
//              start: 1104, end: 1464, name: '3_columns_min_1104_max_1464'),
//          const Breakpoint(
//              start: 1464, end: double.infinity, name: 'max_width'),
//        ],
//      ),
      //    theme:
      //        settings.isLight! ? AppThemeData.lightTheme : AppThemeData.darkTheme,
    );
  }
}
