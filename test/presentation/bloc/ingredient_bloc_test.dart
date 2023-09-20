import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

import '../../helpers/dummy_data/const_test_data.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  MockGetRecipeUseCase mockGetRecipeUseCase;
  RecipeBloc recipeBloc;
  setUp(() {
    mockGetRecipeUseCase = MockGetRecipeUseCase();
    recipeBloc = RecipeBloc(mockGetRecipeUseCase);
  });

  test('Initial state is empty', () {
    expect(recipeBloc.state, NoIngredient());
  });
  blocTest<RecipeBloc, RecipeState>(
    'should emit [IngredientLoading]  and [IngredientSelected] when data is available',
    build: () {
      when(mockGetRecipeUseCase.getIngredients())
          .thenAnswer((_) async => Right(testIngredientEntityList));

      return recipeBloc;
    },
    act: (bloc) => bloc.add(OnIngredientSelected(testIngredientEntity)),
    expect: () => [
      IngredientLoading(),
      // IngredientSelected(ingredientList: testIngredientEntityList),
    ],
  );
  blocTest<RecipeBloc, RecipeState>(
    'should emit [IngredientLoading]  and [IngredientLoadFailure] when data is available',
    build: () {
      when(mockGetRecipeUseCase.getIngredients())
          .thenAnswer((_) async => Left(ServerFailure('Server failure')));

      return recipeBloc;
    },
    act: (bloc) => bloc.add(OnIngredientSelected(testIngredientEntity)),
    expect: () => [
      IngredientLoading(),
      IngredientLoadFailure('Server failure'),
    ],
  );
}
