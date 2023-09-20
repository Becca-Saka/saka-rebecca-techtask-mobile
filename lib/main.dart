import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/core/routes/app_pages.dart';
import 'package:tech_task/locator.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';

import 'presentation/pages/date_selector_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<RecipeBloc>()),
      ],
      child: MaterialApp(
        title: 'Tech Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
          ),
        ),
        home: DateSelectorPage(),
        initialRoute: AppPages.initial,
        onGenerateRoute: AppPages.onGenerateRoute,
      ),
    );
  }
}
