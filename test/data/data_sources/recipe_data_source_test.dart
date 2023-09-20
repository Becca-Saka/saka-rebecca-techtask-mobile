import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tech_task/core/constants/constants.dart';
import 'package:tech_task/core/error/exceptions.dart';
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/data/models/ingredient_model.dart';
import 'package:tech_task/data/models/recipe_model.dart';

import '../../helpers/dummy_data/const_test_data.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
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
        'should return Ingredient model list when the response is 200',
        () async {
          when(mockHttpClient.get(Uri.parse(Urls.ingredientListUrl)))
              .thenAnswer(
            (_) async => http.Response(
              readJson(dummyIngredientJsonUrl),
              200,
            ),
          );
          final result = await recipeDataSourceImpl.getIngredients();

          expect(result, isA<List<IngredientModel>>());
        },
      );
      test(
        'should return server exception when the response is not 200',
        () async {
          when(mockHttpClient.get(Uri.parse(Urls.ingredientListUrl)))
              .thenAnswer(
            (_) async => http.Response(
              'Not found',
              404,
            ),
          );
          expect(() async {
            await recipeDataSourceImpl.getIngredients();
          }, throwsA(isA<ServerException>()));
        },
      );
      test(
        'should return recipe model list when the response is 200',
        () async {
          final selectedIngredient =
              testIngredientModelList.map((e) => e.title).toList();
          final url =
              Uri.parse(Urls.recipesUrl + "${selectedIngredient.join(",")}");
          when(mockHttpClient.get(url)).thenAnswer(
            (_) async => http.Response(
              readJson(dummyRecipeJsonUrl),
              200,
            ),
          );
          final result =
              await recipeDataSourceImpl.getRecipe(selectedIngredient);

          expect(result, isA<List<RecipeModel>>());
        },
      );
      test(
        'should return server exception when the response is not 200',
        () async {
          final selectedIngredient =
              testIngredientModelList.map((e) => e.title).toList();
          final url =
              Uri.parse(Urls.recipesUrl + "${selectedIngredient.join(",")}");
          when(mockHttpClient.get(url)).thenAnswer(
            (_) async => http.Response(
              'Not Found',
              404,
            ),
          );
          expect(() async {
            await recipeDataSourceImpl.getRecipe(selectedIngredient);
          }, throwsA(isA<ServerException>()));
        },
      );
    },
  );
}
