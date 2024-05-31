import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_population/ui/home/home_screen.dart';

import 'bloc/state_population_bloc.dart';
import 'config/navigation/app_router.dart';
import 'config/values/colors.dart';
import 'data/repositories/state_population_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "US"),
      ],
      path: 'assets/languages',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StatePopulationBloc(
            repository: StatePopulationRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: "States Population App",
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: primaryColor,
          ),
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: rootPath,
      ),
    );
  }

  void dispose() {
    _appRouter.dispose();
  }
}
