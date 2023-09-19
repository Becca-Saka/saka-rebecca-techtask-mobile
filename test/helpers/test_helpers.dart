import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';

@GenerateMocks(
  [
    RecipeRepository,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
