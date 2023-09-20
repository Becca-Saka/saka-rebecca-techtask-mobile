import 'package:flutter/material.dart';
import 'package:tech_task/presentation/pages/date_selector_page.dart';
import 'package:tech_task/presentation/pages/ingredient_list_page.dart';
import 'package:tech_task/presentation/pages/todays_meal_page.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.initial;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
          builder: (_) => DateSelectorPage(),
          settings: settings,
        );
      case AppRoutes.ingrendientList:
        return MaterialPageRoute(
          builder: (_) => const IngredientListPage(),
          settings: settings,
        );
      case AppRoutes.todayMeal:
        final argument = settings.arguments as DateTime;
        return MaterialPageRoute(
          builder: (_) => TodaysMealPage(
            selectedDate: argument,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
