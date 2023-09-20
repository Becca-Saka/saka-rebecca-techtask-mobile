import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/data/repositories/recipe_repository_impl.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => RecipeBloc(locator()));
  locator.registerLazySingleton(() => GetRecipeUseCase(locator()));
  locator.registerLazySingleton<RecipeRepository>(
      () => RecipeRepositoryImpl(recipeDataSource: locator()));
  locator.registerLazySingleton<RecipeDataSource>(
      () => RecipeDataSourceImpl(client: locator()));
  // locator.registerFactory(() => DatePickerBloc());

  _registerExternalServices();
}

void _registerExternalServices() {
  locator.registerLazySingleton(() => http.Client());
}
