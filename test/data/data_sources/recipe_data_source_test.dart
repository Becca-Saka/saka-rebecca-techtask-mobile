import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tech_task/core/constants/constants.dart';
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/data/models/ingredient_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  const String dummyJsonUrl =
      "helpers/dummy_data/dummy_ingredient_response.json";

  MockHttpClient mockHttpClient;
  RecipeDataSourceImpl recipeDataSourceImpl;

  setUp(
    () {
      mockHttpClient = MockHttpClient();
      recipeDataSourceImpl = RecipeDataSourceImpl(
        client: mockHttpClient,
      );
    },
  );
  group(
    'Get ingredients',
    () {
      test(
        'should return Ingredient model when the response is 200',
        () async {
          when(mockHttpClient.get(Uri.parse(Urls.ingredientListUrl)))
              .thenAnswer(
            (_) async => http.Response(
              readJson(dummyJsonUrl),
              200,
            ),
          );
          final result = await recipeDataSourceImpl.getIngredients();

          expect(result, isA<List<IngredientModel>>());
        },
      );
    },
  );
}
