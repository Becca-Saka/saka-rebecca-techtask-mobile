import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';

@GenerateMocks(
  [
    RecipeRepository,
    RecipeDataSource,
    GetRecipeUseCase,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
