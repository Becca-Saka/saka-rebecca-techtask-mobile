import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/domain/models/ingredient.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  GetRecipeUseCase getRecipeUseCase;
  MockRecipeRepository mockRecipeRepository;

  final testIngredientDetails = IngredientModel(
    title: 'Curry',
    useBy: DateTime.now(),
  );
  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    getRecipeUseCase = GetRecipeUseCase(mockRecipeRepository);
  });

  test(
    'should get ingredients from the repository',
    () async {
      //arrange
      when(mockRecipeRepository.getIngredient())
          .thenAnswer((_) async => Right(testIngredientDetails));
      //act
      final result = await getRecipeUseCase.getIngredients();
      //assert
      expect(result, Right(testIngredientDetails));
    },
  );
}
