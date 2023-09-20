import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';

import '../../helpers/dummy_data/const_test_data.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  GetRecipeUseCase getRecipeUseCase;
  MockRecipeRepository mockRecipeRepository;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    getRecipeUseCase = GetRecipeUseCase(mockRecipeRepository);
  });

  test(
    'should get ingredients from the repository',
    () async {
      //arrange
      when(mockRecipeRepository.getIngredient())
          .thenAnswer((_) async => Right(testIngredientEntityList));
      //act
      final result = await getRecipeUseCase.getIngredients();
      //assert
      expect(result, Right(testIngredientEntityList));
    },
  );
  test(
    'should get recipe from the repository',
    () async {
      //arrange
      final selectedIngredient =
          testIngredientModelList.map((e) => e.title).toList();
      // final url =
      //     Uri.parse(Urls.recipesUrl + "${selectedIngredient.join(",")}");
      when(mockRecipeRepository.getRecipe(selectedIngredient))
          .thenAnswer((_) async => Right(testRecipeEntityList));
      //act
      final result = await getRecipeUseCase.getIngredients();
      //assert
      expect(result, Right(testIngredientEntityList));
    },
  );
}
