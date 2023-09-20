import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';

@GenerateMocks(
  [
    RecipeRepository,
    RecipeDataSource,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
